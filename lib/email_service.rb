class EmailService
  def create(email)
    header = create_header(email)
    body = encrypt_body(email)
    signature = create_signature(email)

    header + "\n" + body + "\n" + signature
  end

  private

  def create_header(email)
    "Dear #{email[:recipient_name]}:"
  end

  def create_signature(email)
    "Sincerely,\n" + email[:sender_name]
  end

  LETTER_SET =  "acdegilmnoprstuw"
  def encrypt_body(email)
    body = email[:body]
    encrypted_body = body.chars.inject(7) do |result, n|
      (result * 37) + (LETTER_SET.index(n) || 11)
    end
    encrypted_body.to_s
  end
end
