class LikesController < ApplicationController
  before_action :set_scholar

  def create
    @like = current_user.likes.new(scholar_id: @scholar.id)
    @like.save
    @likes = Like.where(scholar_id: @scholar.id)
  end

  def destroy
    @like = Like.find_by(scholar_id: @scholar.id, user_id: current_user.id).destroy
    @likes = Like.where(scholar_id: @scholar.id)
  end

  private
  def set_scholar
    @scholar = Scholar.find(params[:scholar_id])
  end
end
