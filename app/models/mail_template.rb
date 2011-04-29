class MailTemplate < ActiveRecord::Base

  #-------------------------#
  # self.new_from_sent_mail #
  #-------------------------#
  def self.new_from_sent_mail( sent_mail )
    self.new( :title => sent_mail[:subject], :subject => sent_mail[:subject], :reply_to => sent_mail[:reply_to], :body => sent_mail[:body] )
  end
  
  #----------------#
  # self.get_title #
  #----------------#
  def self.get_title( template_id )
    template = self.find_by_id( template_id, :select => "title" )
    
    unless template.blank?
      return template.title
    else
      return ""
    end
  end

  #--------------------#
  # self.get_send_mail #
  #--------------------#
  # 送信メール取得
  def self.get_send_mail( event_id )
    event = Event.find_by_id( event_id, :select => "mail_template_id" )
    unless event.blank?
      send_mail = self.find_by_id( event.mail_template_id )
      unless send_mail.blank?
        return send_mail
      else
        return self.new
      end
    else
      return self.new
    end
  end
  
end
