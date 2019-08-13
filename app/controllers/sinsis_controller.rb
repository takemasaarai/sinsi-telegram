class SinsisController < ApplicationController
  before_action :set_sinsi, only: [:show, :edit, :update, :destroy]

  # GET /sinsis
  # GET /sinsis.json
  def index
    @sinsis = Sinsi.all
  end

  # GET /sinsis/1
  # GET /sinsis/1.json
  def show
  end

  # GET /sinsis/new
  def new
    @sinsi = Sinsi.new
  end

  # GET /sinsis/1/edit
  def edit
  end

  # POST /sinsis
  # POST /sinsis.json
  def create
    @sinsi = Sinsi.new(sinsi_params)

    respond_to do |format|
      if @sinsi.save
        format.html { redirect_to @sinsi, notice: 'Sinsi was successfully created.' }
        format.json { render :show, status: :created, location: @sinsi }
      else
        format.html { render :new }
        format.json { render json: @sinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sinsis/1
  # PATCH/PUT /sinsis/1.json
  def update
    respond_to do |format|
      if @sinsi.update(sinsi_params)
        format.html { redirect_to @sinsi, notice: 'Sinsi was successfully updated.' }
        format.json { render :show, status: :ok, location: @sinsi }
      else
        format.html { render :edit }
        format.json { render json: @sinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sinsis/1
  # DELETE /sinsis/1.json
  def destroy
    @sinsi.destroy
    respond_to do |format|
      format.html { redirect_to sinsis_url, notice: 'Sinsi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sinsi
      @sinsi = Sinsi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sinsi_params
      params.require(:sinsi).permit(:title, :description, :picture)
    end
end
