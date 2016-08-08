class VentaController < ApplicationController
  before_action :set_ventum, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /venta
  # GET /venta.json
  def index
    #@venta = Ventum.all
    @venta = Ventum.paginate(:per_page => 5, :page => params[:page])
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
    combo_pedido
  end

  # GET /venta/new
  def new
    combo_pedido
    @ventum = Ventum.new
  end

  # GET /venta/1/edit
  def edit
    combo_pedido
  end

  # POST /venta
  # POST /venta.json
  def create
    combo_pedido
    @ventum = Ventum.new(ventum_params)

    respond_to do |format|
      if @ventum.save
        format.html { redirect_to @ventum, notice: 'La Venta Fue Creada Exitosamente.' }
        format.json { render :show, status: :created, location: @ventum }
      else
        format.html { render :new }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venta/1
  # PATCH/PUT /venta/1.json
  def update
    respond_to do |format|
      if @ventum.update(ventum_params)
        format.html { redirect_to @ventum, notice: 'La Venta fue Actualizada Exitosamente.' }
        format.json { render :show, status: :ok, location: @ventum }
      else
        format.html { render :edit }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    combo_pedido
    @ventum.destroy
    respond_to do |format|
      format.html { redirect_to venta_url, notice: 'La Venta Fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  def combo_pedido
    @pedido_options = Pedido.all.map{ |p| [ p.nombre_cliente + " " + p.apellido_paterno + " " + p.apellido_materno, p.id_pedidos ] }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ventum
    @ventum = Ventum.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ventum_params
    params.require(:ventum).permit(:fecha, :hora, :total, :subtotal, :pedido_fk)
  end
end