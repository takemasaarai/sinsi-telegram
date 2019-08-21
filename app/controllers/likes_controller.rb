class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, sinsi_id: params[:sinsi_id])
    @likes = Like.where(sinsi_id: params[:sinsi_id])
    @sinsis = Sinsi.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, sinsi_id: params[:sinsi_id])
    like.destroy
    @likes = Like.where(sinsi_id: params[:sinsi_id])
    @sinsis = Sinsi.all
  end
end
