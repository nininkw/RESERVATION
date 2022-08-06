class ReservationsController < ApplicationController
  def index
    @users = User.all
    @room_posts = RoomPost.all
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room_post = RoomPost.find(@reservation.room_id)
    @days = (@reservation.check_out-@reservation.check_in).to_i
    @total_fee = @room_post.room_fee * @reservation.people * @days  
  end

  def create
    @reservation = Reservation.new(reservation_params)  
    @room_post = RoomPost.find(@reservation.room_id) 
    if params[:back] || !@reservation.save
      render template: "room_posts/show"
    else
      @reservation.save
      redirect_to reservation_path(@reservation.id)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.permit(:check_in, :check_out, :people, :room_id, :@total_fee, :@days).merge(user_id: current_user.id)
  end
end

