class HamburguesasController < ApplicationController
  before_action :set_hamburguesa, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /hamburguesas
  # GET /hamburguesas.json
  def index
    @hamburguesas = Hamburguesa.all
    render json: @hamburguesas
  end

  # GET /hamburguesas/1
  # GET /hamburguesas/1.json
  def show
    @hamburguesa = Hamburguesa.find(params[:id])
    render json: @hamburguesa
  end

  # GET /hamburguesas/new
  def new
    @hamburguesa = Hamburguesa.new
  end

  # GET /hamburguesas/1/edit
  def edit
  end

  # POST /hamburguesas
  # POST /hamburguesas.json
  def create
    @hamburguesa = Hamburguesa.new(hamburguesa_params)

    respond_to do |format|
      if @hamburguesa.save
        format.html { redirect_to @hamburguesa, notice: 'Hamburguesa was successfully created.' }
        format.json { render :show, status: :created, location: @hamburguesa }
      else
        format.html { render :new }
        format.json { render json: @hamburguesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hamburguesas/1
  # PATCH/PUT /hamburguesas/1.json
  def update
    respond_to do |format|
      if @hamburguesa.update(hamburguesa_params)
        format.html { redirect_to @hamburguesa, notice: 'Hamburguesa was successfully updated.' }
        format.json { render :show, status: :ok, location: @hamburguesa }
      else
        format.html { render :edit }
        format.json { render json: @hamburguesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hamburguesas/1
  # DELETE /hamburguesas/1.json
  def destroy
    @hamburguesa.destroy
    respond_to do |format|
      format.html { redirect_to hamburguesas_url, notice: 'Hamburguesa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hamburguesa
      @hamburguesa = Hamburguesa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hamburguesa_params
      params.require(:hamburguesa).permit(:nombre, :precio, :descripcion)
    end
end
