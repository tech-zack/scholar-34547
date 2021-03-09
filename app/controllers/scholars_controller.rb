class ScholarsController < ApplicationController
  def index
    @scholars = Scholar.all
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

  private
  
  def scholar_params
    params.require(:scholar).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end
  
end
