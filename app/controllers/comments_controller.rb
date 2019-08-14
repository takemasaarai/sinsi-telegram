class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :destroy]
  before_action :set_comment, only: [:destroy, :show]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'コメントを書き込みました！' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'コメントを削除しました！' }
      format.json { head :no_content }
    end
  end

  private

    def set_comment
      @comment = comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :sinsi_id)
    end
end
