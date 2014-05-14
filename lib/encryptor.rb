class Encryptor
  LETTER_SET =  "acdegilmnoprstuw"
  def create(email)
    body = email[:body]
    encrypted_body = body.chars.inject(7) do |result, n|
      (result * 37) + (LETTER_SET.index(n) || 11)
    end
    encrypted_body.to_s
  end
end
