require 'encryptor'
require 'header'
require 'footer'

class EmailService
  def initialize
    @operators = [Header.new, Encryptor.new, Footer.new]
  end

  def create(email)
    @operators.inject("") do |result, operator|
      result += operator.create(email) + '\n'
    end
  end
end
