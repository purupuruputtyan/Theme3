class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

private

  def user_params#10章
    params.require(:user).permit(:name)
  end
end

