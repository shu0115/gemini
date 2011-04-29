class CreateSentMails < ActiveRecord::Migration
  def self.up
    create_table :sent_mails do |t|
      t.string :from
      t.string :to
      t.string :cc
      t.string :bcc
      t.string :subject
      t.text :body
      t.string :reply_to
      t.datetime :mail_send_at
      t.text :result

      t.timestamps
    end
  end

  def self.down
    drop_table :sent_mails
  end
end
