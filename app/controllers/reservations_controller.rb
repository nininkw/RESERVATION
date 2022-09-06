class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
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
    if @reservation.save
      flash[:notice] = "予約を確定しました"
      redirect_to reservation_path(@reservation.id)
    else
      render template: "room_posts/show"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room_post = RoomPost.find(@reservation.room_id)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :people, :room_id, :total_fee, :days).merge(user_id: current_user.id)
  end
end

