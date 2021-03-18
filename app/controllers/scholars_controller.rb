class ScholarsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_scholar, only:[:edit,:update,:show,:destroy]
  before_action :move_to_index, except: [:index, :show,:new,:create,:category]
  before_action :search_category_scholar, only:[:index, :category, :search, :show]

  def index
    @scholars = Scholar.order(created_at: :desc).page(params[:page]).per(3)
  end

  def new
    @scholar = Scholar.new
  end

  def create
    @scholar = Scholar.new(scholar_params)
    if @scholar.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @messages = @scholar.messages.includes(:user)
  end

  def edit
  end

  def update
    if @scholar.update(scholar_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @scholar.destroy
      redirect_to root_path
    end
  end

  def category
    @scholars = @q.result.page(params[:page]).per(3).order("created_at DESC")
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end
  
  private

  def search_category_scholar
    @q= Scholar.ransack(params[:q])
  end
  
  def scholar_params
    params.require(:scholar).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_scholar
    @scholar = Scholar.find(params[:id])
  end

  def move_to_index
    if current_user != @scholar.user
    redirect_to action: :index
    end
  end

end
