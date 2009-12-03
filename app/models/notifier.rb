class Notifier < ActionMailer::Base

  def password_reset_instructions(user)  
    subject       "Arid.be - Password Reset Instructions"  
    from          "Arid"  
    recipients    user.email  
    sent_on       Time.now  
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end

end
