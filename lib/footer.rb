class Footer
  def create(email)
    "Sincerely,\n" + email[:sender_name]
  end
end
