class UsersController < ApplicationController
  before_action :search_category_scholar, only:[:show]
  
  def show
    @user = User.find(params[:id])
    @scholars = current_user.scholars.order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def search_category_scholar
    @q= Scholar.ransack(params[:q])
  end

end