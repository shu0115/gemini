class AddColumn01 < ActiveRecord::Migration
  def self.up
    add_column :group_members, :group_id, :integer
  end

  def self.down
  end
end
