class Year
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def leap?
    mundane_leap_year? || exceptional_century? 
  end

  private

  def mundane_leap_year?
    year % 4 == 0 && !century?
  end

  def century?
    year % 100 == 0 
  end

  def exceptional_century?
    year % 400 == 0
  end

end