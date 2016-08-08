class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /pedidos
  # GET /pedidos.json
  def index
    #@pedidos = Pedido.all
    @pedidos = Pedido.order(fecha: :desc).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    combo_empleados
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
    combo_empleados
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    combo_empleados

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'El Pedido Fue Creado Exitosamente.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'El Pedido Fue Actualizado Exitosamente.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'El Pedido Fue Eliminado Exitosamente.' }
      format.json { head :no_content }
    end
  end

  def combo_empleados
    @user_options = Usuario.all.map{ |u| [ u.nombre + " " + u.apellido_paterno + " " + u.apellido_materno, u.id_usuarios ] }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:nombre_cliente, :apellido_paterno, :apellido_materno, :fecha, :hora, :direccion, :telefono, :usuario_fk)
    end
end