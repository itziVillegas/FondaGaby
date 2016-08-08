class ProductoPlatillosController < ApplicationController
  before_action :set_producto_platillo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /producto_platillos
  # GET /producto_platillos.json
  def index
    #@producto_platillos = ProductoPlatillo.all
    @producto_platillos = ProductoPlatillo.paginate(:per_page => 5, :page => params[:page])
  end

  # GET /producto_platillos/1
  # GET /producto_platillos/1.json
  def show
    combo_producto
    combo_platillo
  end

  # GET /producto_platillos/new
  def new
    combo_producto
    combo_platillo
    @producto_platillo = ProductoPlatillo.new
  end

  # GET /producto_platillos/1/edit
  def edit
    combo_producto
    combo_platillo
  end

  # POST /producto_platillos
  # POST /producto_platillos.json
  def create
    combo_producto
    combo_platillo
    @producto_platillo = ProductoPlatillo.new(producto_platillo_params)

    respond_to do |format|
      if @producto_platillo.save
        format.html { redirect_to @producto_platillo, notice: 'El Detalle del Platillo Fue Creado Exitosamente.' }
        format.json { render :show, status: :created, location: @producto_platillo }
      else
        format.html { render :new }
        format.json { render json: @producto_platillo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /producto_platillos/1
  # PATCH/PUT /producto_platillos/1.json
  def update
    respond_to do |format|
      if @producto_platillo.update(producto_platillo_params)
        format.html { redirect_to @producto_platillo, notice: 'El Detalle del Platillo Fue Actualizado Exitosamente.' }
        format.json { render :show, status: :ok, location: @producto_platillo }
      else
        format.html { render :edit }
        format.json { render json: @producto_platillo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producto_platillos/1
  # DELETE /producto_platillos/1.json
  def destroy
    combo_producto
    combo_platillo
    @producto_platillo.destroy
    respond_to do |format|
      format.html { redirect_to producto_platillos_url, notice: 'El Detalle del Platillo Fue Eliminado Exitosamente.' }
      format.json { head :no_content }
    end
  end

  def combo_producto
    @producto_options = Producto.all.map{ |pr| [ pr.nombre, pr.id_producto ] }
  end

  def combo_platillo
    @platillo_options = Platillo.all.map{ |pl| [ pl.nombre, pl.id_platillo ] }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_producto_platillo
    @producto_platillo = ProductoPlatillo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def producto_platillo_params
    params.require(:producto_platillo).permit(:id_pro_pla, :producto, :platillo, :cantidad, :unidad_medida)
  end
end