class IngredientesController < ApplicationController
  #before_action :set_ingrediente, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /ingredientes
  # GET /ingredientes.json
  def index
    @ingredientes = Ingrediente.all
    render json: @ingredientes, :except => [:created_at, :updated_at]
  end

  # GET /ingredientes/1
  # GET /ingredientes/1.json
  def show
    if Ingrediente.exists?(id: params[:id])
      @ingrediente = Ingrediente.find(params[:id])
      render json: @ingrediente, :except => [:created_at, :updated_at]
    else
      if helpers.is_not_number?(params[:id])
        render json: {message: 'id invalido', status: 400}, status: 400
      else

        render json: {message: 'ingrediente inexistente', status: 404}, status: 404
      end
    end
  end

  # GET /ingredientes/new
  def new
    @ingrediente = Ingrediente.new
  end

  # GET /ingredientes/1/edit
  def edit
  end

  # POST /ingredientes
  # POST /ingredientes.json
  def create
    @nombre = params[:nombre]
    @descripcion = params[:descripcion]
    if @nombre.nil? || @descripcion.nil?  
      render json: {message: "input invalido", status: 400}, status: 400
    else
      if helpers.is_not_number?(@nombre) && helpers.is_not_number?(@descripcion)
        if !@nombre.empty? || !@descripcion.empty?
          @ingrediente = Ingrediente.create(nombre: params[:nombre], descripcion: params[:descripcion], id: params[:id])
          render json: @ingrediente, :except => [:created_at, :updated_at], status: 201
        else
          render json: {message: "input invalido", status: 400}, status: 400

        end
      else
        render json: {message: "input invalido", status: 400}, status: 400
      end
      

      
    end
  end

  # PATCH/PUT /ingredientes/1
  # PATCH/PUT /ingredientes/1.json
  def update
    respond_to do |format|
      if @ingrediente.update(ingrediente_params)
        format.html { redirect_to @ingrediente, notice: 'Ingrediente was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingrediente }
      else
        format.html { render :edit }
        format.json { render json: @ingrediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredientes/1
  # DELETE /ingredientes/1.json
  def destroy
    if Ingrediente.exists?(id: params[:id])
      @ingrediente = Ingrediente.find(params[:id])
      if @ingrediente.hamburguesaingredientes.length > 0
        render json: {message: 'Ingrediente no se puede borrar, se encuentra presente en una hamburguesa', status: 409}, status: 409
      else

        @ingrediente.destroy
        render json: {message: 'ingrediente eliminado', status: 200}, status: 200
      end
    else
      render json: {message: 'ingrediente inexistente', status: 404}, status: 404
    end
    
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingrediente
      @ingrediente = Ingrediente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingrediente_params
      params.require(:ingrediente).permit(:nombre, :descripcion)
    end
end
