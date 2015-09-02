require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  before (:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @inquiry = Inquiry.new
    @inquiry.name = "Gypsy"
    @inquiry.email = "gypsy@goo.com"
    @inquiry.message = "A bunch of baby ducks. Send them to the moon."

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

  it 'renders the sender email' do
    expect(ActionMailer::Base.deliveries.first.from).to eq([ "from@example.com" ])
  end



end
