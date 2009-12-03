class User < ActiveRecord::Base
  acts_as_authentic
  login_field :email
  
  has_many :comments
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
end
