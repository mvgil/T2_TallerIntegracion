class HamburguesaingredientesController < ApplicationController
  #before_action :set_hamburguesaingrediente, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  

  # GET /hamburguesaingredientes
  # GET /hamburguesaingredientes.json
  def index
    @hamburguesaingredientes = Hamburguesaingrediente.all
    #@retorno = json: @hamburguesaingredientes, :except => [:created_at, :updated_at]
    #render @retorno.push({"holi" => "salu"})
    #render json: @hamburguesaingredientes, :except => [:created_at, :updated_at]
    #@hamburguesa = Hamburguesa.find(1)
    
    #format.json { render :show, status: :created, location: @hamburguesa }
  end

  # GET /hamburguesaingredientes/1
  # GET /hamburguesaingredientes/1.json
  def show
  end

  # GET /hamburguesaingredientes/new
  def new
    @hamburguesaingrediente = Hamburguesaingrediente.new
  end

  # GET /hamburguesaingredientes/1/edit
  def edit
  end

  # POST /hamburguesaingredientes
  # POST /hamburguesaingredientes.json
  def agregar_ingrediente
    @path = "https://apihamburguesas.herokuapp.com/ingrediente/"

    if Hamburguesa.exists?(id: params[:id_hamburguesa]) && Ingrediente.exists?(id: params[:id_ingrediente])
      @hamburguesa = Hamburguesa.find(params[:id_hamburguesa])
      if @hamburguesa.hamburguesaingredientes.find_by_ingrediente_id(params[:id_ingrediente])
        render json: {message: 'ya estaba agregado', status: 200}, status: 200
      else
        @hamburguesaingrediente = @hamburguesa.hamburguesaingredientes.build(ingrediente_id: params[:id_ingrediente])
        @hamburguesaingrediente.hamburguesa_id = params[:id_hamburguesa]
        @ingrediente = Ingrediente.find(params[:id_ingrediente])
        @hamburguesaingrediente.path = @ingrediente.path_ingrediente(@path)
        @hamburguesaingrediente.save
        render json: {message: 'ingrediente agregado', status: 201}, status: 201
      end

    else
      if !Hamburguesa.exists?(id: params[:id_hamburguesa])
        render json: {message: 'Id de hamburguesa inválido', status: 400}, status: 400
      else
        render json: {message: 'Ingrediente inexistente', status: 404}, status: 404
      end
    end

    
    
    #@hamburguesa = Hamburguesa.find(params[:id_hamburguesa])
    #@hamburguesaingrediente = @hamburguesa.hamburguesaingredientes.build(ingrediente_id: params[:id_ingrediente])
    #@hamburguesaingrediente.hamburguesa_id = params[:id_hamburguesa]
    #@ingrediente = Ingrediente.find(params[:id_ingrediente])
    #@hamburguesaingrediente.path = @ingrediente.path_ingrediente(@path)
    #@hamburguesaingrediente.save
    #render json: @hamburguesaingrediente, :except => [:created_at, :updated_at]
  end
  def create
    @hamburguesaingrediente = Hamburguesaingrediente.new(hamburguesaingrediente_params)

    respond_to do |format|
      if @hamburguesaingrediente
        hamburguesaingrediente.save
        format.html { redirect_to @hamburguesaingrediente, notice: 'Hamburguesaingrediente was successfully created.' }
        format.json { render :show, status: :created, location: @hamburguesaingrediente }
      else
        format.html { render :new }
        format.json { render json: @hamburguesaingrediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hamburguesaingredientes/1
  # PATCH/PUT /hamburguesaingredientes/1.json
  def update
    respond_to do |format|
      if @hamburguesaingrediente.update(hamburguesaingrediente_params)
        format.html { redirect_to @hamburguesaingrediente, notice: 'Hamburguesaingrediente was successfully updated.' }
        format.json { render :show, status: :ok, location: @hamburguesaingrediente }
      else
        format.html { render :edit }
        format.json { render json: @hamburguesaingrediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hamburguesaingredientes/1
  # DELETE /hamburguesaingredientes/1.json
  def destroy
    if !Hamburguesa.exists?(id: params[:id_hamburguesa])
      render json: {message: 'Id de hamburguesa inválido', status: 400 }, status: 400
    else
      @hamburguesa = Hamburguesa.find(params[:id_hamburguesa])
      if @hamburguesa.hamburguesaingredientes.find_by_ingrediente_id(params[:id_ingrediente])
         @hamburguesaingrediente = Hamburguesaingrediente.find_by_hamburguesa_id_and_ingrediente_id(params[:id_hamburguesa], params[:id_ingrediente])
         @hamburguesaingrediente.destroy
         render json: {message: 'ingrediente retirado', status: 200}, status: 200
      else
        render json: {message: 'Ingrediente inexistente en la hamburguesa', status: 404}, status: 404
      end
    #@hamburguesaingrediente = Hamburguesaingrediente.find_by_hamburguesa_id_and_ingrediente_id(params[:id_hamburguesa], params[:id_ingrediente])
    #@hamburguesaingrediente.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hamburguesaingrediente
      @hamburguesaingrediente = Hamburguesaingrediente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hamburguesaingrediente_params
      params.require(:hamburguesaingrediente).permit(:id_hamburguesa, :id_ingrediente)
    end
end
