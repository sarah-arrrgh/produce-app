class InquiriesController < ApplicationController

  def new
  end

  def create
    inquiry = Inquiry.new
    inquiry.name = params[:inquiry][:name]
    inquiry.email = params[:inquiry][:email]
    inquiry.subject = params[:inquiry][:subject]
    inquiry.message = params[:inquiry][:message]

    InquiryMailer.inquiry_email(inquiry).deliver_now

    flash[:notice] = "Thanks for your email! We'll get back to you as soon as we can."
    redirect_to root_url
  end

end
