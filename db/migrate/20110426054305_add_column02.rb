class AddColumn02 < ActiveRecord::Migration
  def self.up
    add_column :sent_mails, :operation_user_id, :integer
  end

  def self.down
  end
end
