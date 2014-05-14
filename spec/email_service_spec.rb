require 'email_service'

describe EmailService do
  let(:service) {EmailService.new}
  let(:email) {{:recipient_name => "Jane Doe",
                :sender_name => "John Smith",
                :body => "This is a secret email that no one can read."}}

  it "encrypts the message" do
    encrypted_body = "370789337613062820554038752357032311805971928193718319518627041663195637830"
    expect(service.create(email)).to include(encrypted_body)
  end

  it "has a hash" do
    hash = "3140736961262072499955166"
    expect(service.create(email)).to include(hash)
  end
end
