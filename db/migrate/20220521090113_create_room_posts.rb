class CreateRoomPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :room_posts do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :room_fee
      t.string :room_address
      t.string :room_img

      t.timestamps
    end
  end
end
