require "test_helper"

class RoomPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get room_posts_index_url
    assert_response :success
  end
end
