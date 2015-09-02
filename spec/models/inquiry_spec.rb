require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  it 'gets and sets name, email, and message' do
    inquiry = Inquiry.new
    inquiry.name = "Natalie"
    inquiry.email = "natalie@noo.com"
    inquiry.message = "Natty natty noo cakes!"

    expect(inquiry.name).to eq("Natalie")
    expect(inquiry.email).to eq("natalie@noo.com")
    expect(inquiry.message).to eq("Natty natty noo cakes!")
  end
end
