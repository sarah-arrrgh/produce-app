class InquiriesController < ApplicationController

  def new
  end

  def create
    inquiry = Inquiry.new
    inquiry.name = params[:inquiry][:name]
    inquiry.email = params[:inquiry][:email]
    inquiry.message = params[:inquiry][:message]

    InquiryMailer.inquiry_email(inquiry).deliver_now

    flash[:notice] = "Thank you for sending us a message!"
    redirect_to root_url
  end

end
