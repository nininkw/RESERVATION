class RemoveRoomIdFromRoomPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :room_posts, :room_id, :integer
  end
end
