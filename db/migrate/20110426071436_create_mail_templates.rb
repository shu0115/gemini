class CreateMailTemplates < ActiveRecord::Migration
  def self.up
    create_table :mail_templates do |t|
      t.integer :user_id
      t.string :from
      t.string :to
      t.string :cc
      t.string :bcc
      t.string :subject
      t.text :body
      t.string :reply_to

      t.timestamps
    end
  end

  def self.down
    drop_table :mail_templates
  end
end
