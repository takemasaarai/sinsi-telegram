class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_comment_user, only: [:destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  # def new
  #   @comment = Comment.new
  # end

  # GET /comments/1/edit
  # def edit
  # end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to sinsi_path(@comment.sinsi_id), notice: 'コメントを書き込みました！' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to sinsi_path(@comment.sinsi_id), alert: 'コメントを書き込めませんでした(１～30文字が限界です)' }
        format.json { render :show, status: :created, location: @comment }
      end
    end
  end

  # # PATCH/PUT /comments/1
  # # PATCH/PUT /comments/1.json
  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to sinsi_path, notice: 'コメントを書き込みました！' }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to sinsi_path(@comment.sinsi_id), notice: 'コメントを削除しました！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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
