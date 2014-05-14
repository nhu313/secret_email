require 'encryptor'
require 'letter_replacer'
require 'hasher'

class EmailService
  def initialize
    hasher = Hasher.new(nil)
    encryptor = Encryptor.new(hasher)
    @operator = LetterReplacer.new(encryptor)
  end

  def create(email)
    @operator.create(email[:body])
  end
end
