class InquiryMailer < ApplicationMailer
  def inquiry_email(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: @inquiry.subject)
  end
end
