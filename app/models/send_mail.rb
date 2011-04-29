class SendMail < ActionMailer::Base
  
  #-----------------#
  # reception_reply #
  #-----------------#
  def reception_reply( reception )
    send_mail = MailTemplate.get_send_mail( reception[:event_id] )
    
    recipients  reception[:mail_address]
    from        send_mail.from
    cc          send_mail.cc
    bcc         send_mail.bcc
    subject     send_mail.subject
    body        :reception => reception, :send_mail => send_mail
    headers["reply-to"]  = send_mail.reply_to
    sent_on     Time.now
  end

end
