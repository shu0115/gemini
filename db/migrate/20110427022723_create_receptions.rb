class CreateReceptions < ActiveRecord::Migration
  def self.up
    create_table :receptions do |t|
      t.integer :event_id
      t.string :name
      t.string :mail_address
      t.string :attend
      t.datetime :mail_send_at
      t.text :result

      t.timestamps
    end
  end

  def self.down
    drop_table :receptions
  end
end
