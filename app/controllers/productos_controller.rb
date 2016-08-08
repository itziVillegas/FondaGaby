class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /productos
  # GET /productos.json
  def index
    #@productos = Producto.all
    @productos = Producto.paginate(:per_page => 5, :page => params[:page])
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @proveedor_options = Proveedore.all.map{ |pro| [ pro.nombre, pro.id_proveedor ] }
  end

  # GET /productos/new
  def new
    @proveedor_options = Proveedore.all.map{ |pro| [ pro.nombre, pro.id_proveedor ] }
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
    @proveedor_options = Proveedore.all.map{ |pro| [ pro.nombre, pro.id_proveedor ] }
  end

  # POST /productos
  # POST /productos.json
  def create
    @proveedor_options = Proveedore.all.map{ |pro| [ pro.nombre, pro.id_proveedor ] }
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'El Producto Fue Creado Exitosamente.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'El Producto Fue Actualizado Exitosamente.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @proveedor_options = Proveedore.all.map{ |pro| [ pro.nombre, pro.id_proveedor ] }
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'El Producto Fue Eliminado Exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:nombre, :fecha_caducidad, :stock, :cantidad_maxima, :categoria, :unidad_medida, :proveedor_fk)
    end
end