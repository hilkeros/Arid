class LanguageController < ApplicationController
  
  def update
    I18n.locale = params[:local]
    redirect_to :back
  end
  
end
