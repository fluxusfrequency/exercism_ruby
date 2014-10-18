class School

  def initialize
    @db = Hash.new([])
  end

  def add(student, grade)
    cohort = @db[grade]
    if !cohort.empty?
       after = cohort.bsearch { |classmate| classmate > student }
       i = cohort.index(after)
       cohort.insert(i - 1)
    else
      @db[grade] << student
    end
  end

  def grade(cohort)
    @db[cohort]
  end

  def to_hash
    sort_all
    @db
  end

  private

  def sort_all
    @db = @db.sort.map.with_object({}) do |(grade, students), sorted|
      sorted[grade] = students.sort
    end
  end

end
