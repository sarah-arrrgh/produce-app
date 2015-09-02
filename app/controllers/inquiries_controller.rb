class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.create(inquiry_params)

    if (@inquiry.valid?)
      InquiryMailer.inquiry_email(@inquiry).deliver_now

      flash[:notice] =
        "Thanks for your email, #{inquiry.name}! We'll get back to you as soon as we can."
      redirect_to root_url

    else
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit( :name, :email, :subject, :message )
  end

end
