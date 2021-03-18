class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :search_category_scholar, only:[:show]
  before_action :move_to_index, except: [:index, :show,:new,:create,:category]
  
  def show
    @user = User.find(params[:id])
    @scholars = current_user.scholars.order(created_at: :desc).page(params[:page]).per(3)
  end

  private

  def search_category_scholar
    @q= Scholar.ransack(params[:q])
  end



end