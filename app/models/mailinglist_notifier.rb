class MailinglistNotifier < ActionMailer::Base
  
  def new_subscription(email)
    setup_default_email_settings
    
    @recipients       = "info@arid.be"
    @subject         += "new subscritpion for the newsletter"
    
    @body[:email]  = email
  end
  
  def setup_default_email_settings
    @from     = '"Arid.be" <info@arid.be>'
    @subject  = "Arid - "
  end
end
