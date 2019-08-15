class SinsisController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :create, :edit, :destroy, :update]
  impressionist actions: [:show]

  def index
    @sinsis = Sinsi.all.order(id: "desc")
  end

  def show
    @preview = Sinsi.find(params[:id]) # No limit
    @sinsi = Sinsi.find_by(id: params[:id])
  end

  def new
    @sinsi = Sinsi.new
  end

  def edit
  end

  def about
  end

  def contact
  end

  def create
    @sinsi = Sinsi.new(sinsi_params)

    respond_to do |format|
      if @sinsi.save
        format.html { redirect_to @sinsi, notice: '投稿が完了しました！' }
        format.json { render :show, status: :created, location: @sinsi }
      else
        format.html { render :new }
        format.json { render json: @sinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sinsi.update(sinsi_params)
        format.html { redirect_to @sinsi, notice: '更新が完了しました！' }
        format.json { render :show, status: :ok, location: @sinsi }
      else
        format.html { render :edit }
        format.json { render json: @sinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sinsi.destroy
    respond_to do |format|
      format.html { redirect_to sinsis_url, notice: '削除が完了しました！' }
      format.json { head :no_content }
    end
  end

  private

    def set_sinsi
      @sinsi = Sinsi.find(params[:id])
    end

    def sinsi_params
      params.require(:sinsi).permit(:title, :word, :picture, :user_id) # Permit params
    end

    def ensure_correct_user
      @sinsi = Sinsi.find_by(id: params[:id])
      if @sinsi.user_id != current_user.id
        flash[:notice] = "投稿者のみが編集できます"
        redirect_back(fallback_location: root_path)
      end
    end
end
