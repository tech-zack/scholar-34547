class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :search_category_scholar, only:[:show]
  before_action :move_to_index, except: [:show,:category]
  
  def show
    @p =  Scholar.all
    if @p.ids.include?(params[:id].to_i)
    @user = User.find(params[:id])
    @scholars = current_user.scholars.order(created_at: :desc).page(params[:page]).per(3)
  end

  private

  def search_category_scholar
    @q= Scholar.ransack(params[:q])
  end

  def move_to_index
    if current_user != @scholar.user
    redirect_to action: :index
    end
  end

end