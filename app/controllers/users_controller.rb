class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @scholars = current_user.scholars.order(created_at: :desc).page(params[:page]).per(5)
  end
end