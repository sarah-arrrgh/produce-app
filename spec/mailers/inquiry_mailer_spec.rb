require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  before (:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @inquiry = Inquiry.new
    @inquiry.name = "Gypsy"
    @inquiry.email = "gypsy@goo.com"
    @inquiry.subject = "A bunch of baby ducks"
    @inquiry.message = "Send them to the moon."

    InquiryMailer.inquiry_email(@inquiry).deliver_now
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'should send the email' do
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  it 'renders the receiver email' do
    expect(ActionMailer::Base.deliveries.first.to).to eq([ @inquiry.email ])
  end

  it 'should set the subject to the correct subject' do
  expect(ActionMailer::Base.deliveries.first.subject).to eq("A bunch of baby ducks")
end

  it 'renders the sender email' do
    expect(ActionMailer::Base.deliveries.first.from).to eq([ "sarah@petonecoop.co.nz" ])
  end



end
