class Say
  attr_reader :number

  def initialize(number)
    @number = number
    raise ArgumentError if @number < 0 || @number > 999_999_999_999
  end

  def in_english
    return "zero" if number == 0
    return teens[number] if (11..19).include?(number)

    return say_billions_place if (1_000_000_000..999_999_999_999).include?(number)
    return say_millions_place if (1_000_000..999_999_999).include?(number)
    return say_thousands_place if (1000..9999).include?(number)
    return say_hundreds_place if (100..999).include?(number)
    return say_tens_place if (20..99).include?(number)

    return ones[number]
  end

  private

  def say_billions_place
    hundred_billion = find_number_in_place(:hundred_billions)
    ten_billion = find_number_in_place(:ten_billions)
    billion = find_number_in_place(:billions)
    million = find_number_in_place(:millions)
    result = [ones[hundred_billion], hundred_billion == 0 ? "" : " hundred ", tens[ten_billion], ones[billion], billion == 0 ? "" : " billion", million == 0 ? "": " ", say_millions_place]
    result.join
  end

  def say_millions_place
    million = find_number_in_place(:millions)
    thousand = find_number_in_place(:thousands)
    result = [ones[million], million == 0 ? "" : " million", thousand == 0 ? "": " ", say_thousands_place]
    result.join
  end

  def say_thousands_place
    thousand = find_number_in_place(:thousands)
    hundred = find_number_in_place(:hundreds)
    result = [ones[thousand], thousand == 0 ? "" : " thousand", hundred == 0 ? "": " ", say_hundreds_place]
    result.join
  end

  def say_hundreds_place
    hundred = find_number_in_place(:hundreds)
    ten = find_number_in_place(:tens)
    result = [ones[hundred], hundred == 0 ? "" : " hundred", ten == 0 ? "" : " ", say_tens_place]
    result.join
  end

  def say_tens_place
    t = tens[find_number_in_place(:tens)]
    o = ones[find_number_in_place(:ones)]
    result = [t, o]
    if t == "" && o != ""
      result.join(" ")
    elsif o == ""
      result.join
    else
      result.join("-")
    end
  end

  def find_number_in_place(place)
    p = places[place]
    number.to_s.chars[p].to_i
  end

  def places
    { :ones => -1,
      :tens => -2,
      :hundreds => -3,
      :thousands => -4,
      :millions => -7,
      :billions => -10,
      :ten_billions => -11,
      :hundred_billions => -12}
  end

  def ones
    { 0 => "",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine" }
  end

  def tens
    { 0 => "",
      1 => "ten",
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety" }
  end

  def teens
    { 11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen" }
  end

end