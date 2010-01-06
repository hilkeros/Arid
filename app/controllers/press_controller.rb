class PressController < ApplicationController
  before_filter :http_auth
  layout "press"
  
  def index
    @posts = Post.press.all
  end

  def show
    @post = Post.press.find_by_permalink(params[:id])
  end
  
  protected
  def http_auth
    authenticate_or_request_with_http_basic("Arid Press Area") do |user_name, password| 
      user_name == 'arid' && password == 'press_password'
    end
  end

end
