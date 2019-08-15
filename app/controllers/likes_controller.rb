class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, sinsi_id: params[:sinsi_id])
    @like.save
    redirect_to("/sinsis/#{params[:sinsi_id]}")
  end
end
