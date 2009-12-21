class MailingAddressesController < ApplicationController

def new
    @mailing_address = MailingAddress.new
  end

  def create
    @mailing_address = MailingAddress.new(params[:mailing_address])
    @mailing_address.save!
    MailinglistNotifier.deliver_new_subscription!(@mailing_address.email)
    flash[:notice] = "Thanks, you are now subscribed to the Arid newsletter."
    redirect_to :back
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Please use valid email address"
    redirect_to :back
  end
end
