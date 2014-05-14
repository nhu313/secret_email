class Header
  def create(email)
    "Dear #{email[:recipient_name]}:"
  end
end
