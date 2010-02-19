class OrderMailer < ActionMailer::Base
  
  def new_order(order)
    setup_default_email_settings
    
    @recipients       = "info@arid.be"
    @subject         += "new order"
    
    @body[:order]  = order
  end
  
  def confirmed(order)
    setup_default_email_settings
    
    @recipients       = "#{order.shipping_address.email}"
    @subject         += "Thanks for your order"
    
    @body[:order]  = order
  end
  
  def sent_order(order)
    setup_default_email_settings
    
    @recipients       = "#{order.shipping_address.email}"
    @subject         += "Your order has been sent"
    
    @body[:order]  = order
  end
  
  def setup_default_email_settings
    @from     = '"Arid.be" <info@arid.be>'
    @subject  = "Arid - "
  end

end
