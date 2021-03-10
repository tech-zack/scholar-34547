class ScholarsController < ApplicationController
  
  def index
    @scholars = Scholar.all
  end

  def new
    @scholars = Scholar.all
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
    @scholar = Scholar.find(params[:id])
    @messages = Message.all
    @message = Message.new
  end

  def edit
    @scholar = Scholar.find(params[:id])
  end

  def update
    @scholar = Scholar.find(params[:id])
    if @scholar.update(scholar_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @scholar = Scholar.find(params[:id])
    if @scholar.destroy
      redirect_to root_path
    end
  end

  private
  
  def scholar_params
    params.require(:scholar).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end
end
