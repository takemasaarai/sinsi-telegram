class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!, only: [:create]
  before_action :ensure_correct_comment_user, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to sinsi_path(@comment.sinsi_id), notice: 'コメントを書き込みました！' }
        format.json { render :show, status: :created, location: @sinsi }
      else
        format.html { render :show }
        format.json { render json: @comment.errors, status: :unprocessable_entity  }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to sinsi_path(@comment.sinsi_id), notice: 'コメントを削除しました！' }
      format.json { head :no_content }
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :sinsi_id, :user_id)
    end

    def ensure_correct_comment_user
      @comment = Comment.find_by(id: params[:id])
      if @comment.user_id != current_user.id
        flash[:alert] = "投稿者のみが削除できます"
        redirect_back(fallback_location: root_path)
      end
    end
end
