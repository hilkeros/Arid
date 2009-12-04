ExceptionNotifier.tap do |notifier|
  notifier.exception_recipients = %w(joren@openminds.be)
  notifier.sender_address =  %("Arid Error" <arid@openminds.be>)
  notifier.email_prefix = "[ARID] "
end