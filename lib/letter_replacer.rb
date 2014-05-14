class LetterReplacer

  def initialize(operator)
    @operator = operator
  end

  def create(message)
    replaced_message = message.gsub('s', "91")
    @operator.create(replaced_message)
  end
end
