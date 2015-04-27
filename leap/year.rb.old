class Year
  class << self

  def leap?(year)
    mundane_leap_year?(year) || exceptional_century?(year)
  end

  private

  def mundane_leap_year?(year)
    year % 4 == 0 && !century?(year)
  end

  def century?(year)
    year % 100 == 0 
  end

  def exceptional_century?(year)
    year % 400 == 0
  end

  end
end