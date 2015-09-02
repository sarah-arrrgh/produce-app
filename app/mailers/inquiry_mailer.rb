class InquiryMailer < ApplicationMailer
  def inquiry_email(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email)
  end
end
