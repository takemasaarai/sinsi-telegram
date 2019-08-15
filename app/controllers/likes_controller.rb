class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, sinsi_id: params[:id])
    @like.save
    redirect_to("/sinsis/#{params[:id]}/show")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, sinsi_id: params[:id])
    @like.destroy
    redirect_to("/sinsis/#{params[:id]}/show")
  end
end
