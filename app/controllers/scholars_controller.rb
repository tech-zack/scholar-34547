class ScholarsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_scholar, only:[:edit,:update,:show, :destroy]
  before_action :move_to_index, except: [:index, :show,:new,:create]
  
  def index
    @scholars = Scholar.all.page(params[:page]).per(5)
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

  
  private
  
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
