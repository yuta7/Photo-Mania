class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
       log_in @user
       redirect_to @user
       flash[:success] = "Photo‐Maniaへようこそ!　自慢の写真をアップしてみよう!"
    else
      render 'new'
    end
  end
  
  private
  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:avatar, :name, :email, :password )
  end
  
end
