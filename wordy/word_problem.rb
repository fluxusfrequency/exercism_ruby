class WordProblem
  def initialize(raw)
    @question = parse_question(raw)
  end

  def answer
    puts @question
    2
  end

  private

  def parse_question(raw)
    match = raw.match("^What is #{question}$")
  end
end
