class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
