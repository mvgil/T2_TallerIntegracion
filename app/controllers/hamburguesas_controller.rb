class HamburguesasController < ApplicationController
  #before_action :set_hamburguesa, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /hamburguesas
  # GET /hamburguesas.json
  def index
    @hamburguesas = Hamburguesa.all
    #@retorno = json: @hamburguesas, :except => [:created_at, :updated_at]
    #render @hamburguesas.as_json
    #render json: {error: 'error'}, status: 400
    render json: @hamburguesas, :except => [:created_at, :updated_at],  :include => {:hamburguesaingredientes => {:only => :path}}, status: 200
  end
  # GET /hamburguesas/1
  # GET /hamburguesas/1.json, :include
  def show
    if Hamburguesa.exists?(id: params[:id])
      #a = Hamburguesa.exists?(id: params[:id])
      @hamburguesa = Hamburguesa.find(params[:id])
      render json: @hamburguesa.as_json(except: [:created_at, :updated_at], include: [:hamburguesaingredientes => {:only => :path}])
      #@hamburguesa.as_json(except: [:created_at, :updated_at], include: [:hamburguesaingredientes => {:only => :path}])
    else
      if helpers.is_not_number?(params[:id])
        render json: {message: "id invalido", status: 400}, status: 400
      else
        render json: {message: "hamburguesa inexistente", status: 404}, status: 404
      end
    end
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
    @nombre = params[:nombre]
    @descripcion = params[:descripcion]
    @precio = params[:precio]
    @imagen = params[:imagen]
    if @nombre.nil? || @precio.nil? || @descripcion.nil? || @imagen.nil? || helpers.is_not_number?(@precio)  
      render json: {message: "input invalido", status: 400}, status: 400
    else
      #si existen pero son parametros vacios ""
      if @nombre.empty? || @precio.empty? || @descripcion.empty? || @imagen.empty?
        render json: {message: "input invalido", status: 400}, status: 400
      else
        @ham = Hamburguesa.create(nombre: @nombre, precio: @precio,descripcion: @descripcion, imagen: @imagen  )
        render json: @ham.as_json(except: [:created_at, :updated_at], include: [:hamburguesaingredientes => {:only => :path}]), status: 201
      end
    end

  end

  # PATCH/PUT /hamburguesas/1
  # PATCH/PUT /hamburguesas/1.json
  def update
    @imagen = params[:imagen]
    @nombre = params[:nombre]
    @descripcion = params[:descripcion]
    @precio = params[:precio]
    @contador_invalidos = 0

    #user.update_attribute(:name, "Zaiste")
    if Hamburguesa.exists?(id: params[:id])
      @hamburguesa = Hamburguesa.find(params[:id])
    
      if @imagen.nil?
        #nada 
      else
        if @imagen.empty?
          @contador_invalidos += 1
          #render json: {message: "parametros invalidos", status: 400}, status: 400
        end

        #@hamburguesa.update_attribute(:imagen, @imagen)
        #@hamburguesa.save

      end
      if @nombre.nil?

        #nada 
      else
        if @nombre.empty?
          @contador_invalidos += 1
        end
        #@hamburguesa.update_attribute(:nombre, @nombre)
        #@hamburguesa.save

      end
      if @descripcion.nil?

        #nada 
      else
        if @descripcion.empty?
          @contador_invalidos += 1
        end
        #@hamburguesa.update_attribute(:descripcion, @descripcion)
        #@hamburguesa.save

      end
      if @precio.nil?

        #nada 
      else
        if @precio.empty? || helpers.is_not_number?(@precio)
          @contador_invalidos += 1
        end
        #@hamburguesa.update_attribute(:precio, @precio)
        #@hamburguesa.save

      end
      if @contador_invalidos > 0
        ## hay parametros invalidos en alguno de los atributos q mandaron
        render json: {message: "parametros invalidos", status: 400}, status: 400
      else
        if @nombre.present?
          @hamburguesa.update_attribute(:nombre, @nombre)
        end
        if @imagen.present?
          @hamburguesa.update_attribute(:imagen, @imagen)
        end
        if @descripcion.present?
          @hamburguesa.update_attribute(:descripcion, @descripcion)
        end
        if @precio.present?
          @hamburguesa.update_attribute(:precio, @precio)
        end
          
        ##una vez que se actualizan los parametros presentes y validos, se renderea el json
        render json: @hamburguesa.as_json(except: [:created_at, :updated_at], include: [:hamburguesaingredientes => {:only => :path}]), status: 200
      end
    
    else
      render json: {message: "hamburguesa inexistente", status: 404}, status: 404
    end
    #render json: @hamburguesa.as_json(except: [:created_at, :updated_at], include: [:hamburguesaingredientes => {:only => :path}]), status: 200
    
  end

  # DELETE /hamburguesas/1
  # DELETE /hamburguesas/1.json
  def destroy
    if Hamburguesa.exists?(id: params[:id])
      @hamburguesa.destroy
      render json: {message: "hamburguesa eliminada", status: 200}, status: 200
    else
      render json: {message: "hamburguesa inexistente", status: 404}, status: 404
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
