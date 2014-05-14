require 'email_service'

describe EmailService do
  let(:service) {EmailService.new}
  let(:email) {{:recipient_name => "Jane Doe",
                :sender_name => "John Smith",
                :body => "This is a secret email that no one can read."}}

  it "encrypts the message" do
    encrypted_body = "7320185666785727313782255754895509292935423938142011803157503339614348"
    expect(service.create(email)).to include(encrypted_body)
  end

  it "adds a header" do
    header = "Dear Jane Doe:"
    expect(service.create(email)).to include(header)
  end

  it "adds a signature" do
    signature = "Sincerely,\nJohn Smith"
    expect(service.create(email)).to include(signature)
  end
end
