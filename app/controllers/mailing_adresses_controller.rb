class MailingAdressesController < ApplicationController

def new
    @mailing_adress = mailing_adress.new
  end

  def create
    @mailing_adress = mailing_adress.new(params[:mailing_adress])
    @mailing_adress.save!
    redirect_to mailing_adresses_path
  end
end
