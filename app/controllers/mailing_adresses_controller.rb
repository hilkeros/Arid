class MailingAdressesController < ApplicationController

def new
    @mailing_adress = MailingAdress.new
  end

  def create
    @mailing_adress = MailingAdress.new(params[:mailing_adress])
    @mailing_adress.save!
    redirect_to mailing_adresses_path
  rescue ActiveRecord::RecordInvalid
    render :new
  end
end
