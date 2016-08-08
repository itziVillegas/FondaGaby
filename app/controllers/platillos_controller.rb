class PlatillosController < ApplicationController
  before_action :set_platillo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /platillos
  # GET /platillos.json
  def index
    #@platillos = Platillo.all
    @platillos = Platillo.paginate(:per_page => 5, :page => params[:page])
  end

  # GET /platillos/1
  # GET /platillos/1.json
  def show
  end

  # GET /platillos/new
  def new
    @platillo = Platillo.new
  end

  # GET /platillos/1/edit
  def edit
  end

  # POST /platillos
  # POST /platillos.json
  def create
    @platillo = Platillo.new(platillo_params)

    respond_to do |format|
      if @platillo.save
        format.html { redirect_to @platillo, notice: 'El Platillo Fue Creado Exitosamente.' }
        format.json { render :show, status: :created, location: @platillo }
      else
        format.html { render :new }
        format.json { render json: @platillo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platillos/1
  # PATCH/PUT /platillos/1.json
  def update
    respond_to do |format|
      if @platillo.update(platillo_params)
        format.html { redirect_to @platillo, notice: 'El Platillo Fue Actualizado Exitosamente.' }
        format.json { render :show, status: :ok, location: @platillo }
      else
        format.html { render :edit }
        format.json { render json: @platillo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platillos/1
  # DELETE /platillos/1.json
  def destroy
    @platillo.destroy
    respond_to do |format|
      format.html { redirect_to platillos_url, notice: 'El Platillo Fue Eliminado Exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platillo
      @platillo = Platillo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platillo_params
      params.require(:platillo).permit(:nombre, :descripcion, :precio, :tamanio)
    end
end