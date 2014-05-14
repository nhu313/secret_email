class Hasher

  def initialize(operator)
    @operator = operator
  end

  def create(message)
    new_message = message + " " + hash(message)
    new_message = @operator.create(new_message) if @operator
    new_message
  end

  def hash(message)
    hashed_message = message.chars.inject(31) do |result, c|
      result += result + c.ord
    end

    hashed_message.to_s
  end
end
