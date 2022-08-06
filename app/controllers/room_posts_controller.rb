class RoomPostsController < ApplicationController
  def index
    @room_posts = RoomPost.all
  
  end
  
  def new
    @room_post = RoomPost.new
    
  end

  def create
    @room_post = RoomPost.new(room_post_params)
      if @room_post.save 
      flash[:notice] = "ルームを登録しました！"
      redirect_to home_top_path
    else
      render.new
    end 
  end   

  def show
    @room_post = RoomPost.find(params[:id])
    @user = @room_post.user
  end

  private

  def room_post_params
    params.require(:room_post).permit(:room_name, :room_introduction, :room_fee, :room_address, :room_img ).merge(user_id: current_user.id)
  end

end

