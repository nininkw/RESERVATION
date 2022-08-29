class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(profile_params)
      flash[:notice] = "プロフィールを更新しました！"
      redirect_to home_top_path
    else
      render :edit
    end 
  end

  private

  def profile_params
    params.require(:user).permit(:icon, :username, :introduction ).merge(id: current_user.id)
  end
end
