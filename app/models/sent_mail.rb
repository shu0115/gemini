class SentMail < ActiveRecord::Base

  #------------------------#
  # self.new_from_template #
  #------------------------#
  def self.new_from_template( t )
    self.new( :from => t.from, :to => t.to, :cc => t.cc, :bcc => t.bcc, :subject => t.subject, :body => t.body, :reply_to => t.reply_to, :mail_template_id => t.id )
  end

end
