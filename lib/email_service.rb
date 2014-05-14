class EmailService
  LETTER_SET =  "acdegilmnoprstuw"

  def create(email)
    header = create_header(email)
    body = encrypt(email[:body]).to_s
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

  def encrypt string
    string.chars.inject(7) do |result, n|
      (result * 37) + (LETTER_SET.index(n) || 11)
    end
  end
end
