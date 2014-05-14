class Encryptor

  LETTER_SET =  "acdegilmnoprstuw"

  def initialize(operator)
    @operator = operator
  end

  def create(message)
    encrypted_message = encrypt(message)
    @operator.create(encrypted_message)
  end

  def encrypt(message)
    encrypted_message = message.chars.inject(7) do |result, n|
      (result * 37) + (LETTER_SET.index(n) || 11)
    end
    encrypted_message.to_s
  end
end
