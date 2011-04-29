class CreateGroupMembers < ActiveRecord::Migration
  def self.up
    create_table :group_members do |t|
      t.string :name
      t.integer :user_id
      t.string :mail_address

      t.timestamps
    end
  end

  def self.down
    drop_table :group_members
  end
end
