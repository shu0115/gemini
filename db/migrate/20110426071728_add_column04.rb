class AddColumn04 < ActiveRecord::Migration
  def self.up
    add_column :sent_mails, :mail_template_id, :integer
    add_column :mail_templates, :title, :string
  end

  def self.down
  end
end
