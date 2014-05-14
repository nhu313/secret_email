require 'encryptor'
require 'letter_replacer'
require 'hasher'
require 'nuller'

class EmailService
  def initialize
    hasher = Hasher.new(Nuller.new(nil))
    encryptor = Encryptor.new(hasher)
    @operator = LetterReplacer.new(encryptor)
  end

  def create(email)
    @operator.create(email[:body])
  end
end
