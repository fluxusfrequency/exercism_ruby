class Series
  def initialize(input)
    @numbers = format(input)
  end

  def slices(n)
    raise ArgumentError if n > @numbers.length
    @numbers.each_cons(n).to_a
  end

  private

  def format(input)
    input.chars.map(&:to_i)
  end
end
