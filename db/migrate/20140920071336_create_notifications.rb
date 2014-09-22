class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.integer :user_id
      t.integer :sender_id
      t.boolean :friend_request?
      t.integer :request_id

      t.timestamps
    end
  end
end
