class AddUserIdToRoomPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :room_posts, :user_id, :integer
  end
end
