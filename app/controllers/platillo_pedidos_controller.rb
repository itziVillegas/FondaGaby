class PlatilloPedidosController < ApplicationController
  before_action :set_platillo_pedido, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /platillo_pedidos
  # GET /platillo_pedidos.json
  def index
    #@platillo_pedidos = PlatilloPedido.all
    @platillo_pedidos = PlatilloPedido.paginate(:per_page => 5, :page => params[:page])
  end

  # GET /platillo_pedidos/1
  # GET /platillo_pedidos/1.json
  def show
    combo_platillo
    combo_pedido
  end

  # GET /platillo_pedidos/new
  def new
    combo_platillo
    combo_pedido
    @platillo_pedido = PlatilloPedido.new
  end

  # GET /platillo_pedidos/1/edit
  def edit
    combo_platillo
    combo_pedido
  end

  # POST /platillo_pedidos
  # POST /platillo_pedidos.json
  def create
    combo_platillo
    combo_pedido
    @platillo_pedido = PlatilloPedido.new(platillo_pedido_params)

    respond_to do |format|
      if @platillo_pedido.save
        format.html { redirect_to @platillo_pedido, notice: 'El Detalle de Pedido Fue Creado Exitosamente.' }
        format.json { render :show, status: :created, location: @platillo_pedido }
      else
        format.html { render :new }
        format.json { render json: @platillo_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platillo_pedidos/1
  # PATCH/PUT /platillo_pedidos/1.json
  def update
    respond_to do |format|
      if @platillo_pedido.update(platillo_pedido_params)
        format.html { redirect_to @platillo_pedido, notice: 'El Detalle de Pedido Fue Actualizado Exitosamente.' }
        format.json { render :show, status: :ok, location: @platillo_pedido }
      else
        format.html { render :edit }
        format.json { render json: @platillo_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platillo_pedidos/1
  # DELETE /platillo_pedidos/1.json
  def destroy
    combo_platillo
    combo_pedido
    @platillo_pedido.destroy
    respond_to do |format|
      format.html { redirect_to platillo_pedidos_url, notice: 'El Detalle de Pedido Fue Eliminado Exitosamente.' }
      format.json { head :no_content }
    end
  end

  def combo_platillo
    @platillo_options = Platillo.all.map{ |pl| [ pl.nombre, pl.id_platillo ] }
  end

  def combo_pedido
    @pedido_options = Pedido.all.map{ |pe| [ pe.nombre_cliente + " " + pe.apellido_paterno + " " + pe.apellido_materno, pe.id_pedidos ] }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_platillo_pedido
    @platillo_pedido = PlatilloPedido.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def platillo_pedido_params
    params.require(:platillo_pedido).permit(:id_pla_ped, :platillo, :pedido, :cantidad)
  end
end