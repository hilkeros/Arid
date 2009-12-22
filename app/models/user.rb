class User < ActiveRecord::Base
  acts_as_authentic do |user|
    user.login_field :email
  end

  has_many :comments

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end

  def before_connect(facebook_session)
    self.name = facebook_session.user.name
  end

end
