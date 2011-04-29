class AddColumn03 < ActiveRecord::Migration
  def self.up
    add_column :sent_mails, :group_id, :integer
  end

  def self.down
  end
end
