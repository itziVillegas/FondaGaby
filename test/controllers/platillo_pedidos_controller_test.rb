require 'test_helper'

class PlatilloPedidosControllerTest < ActionController::TestCase
  setup do
    @platillo_pedido = platillo_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:platillo_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create platillo_pedido" do
    assert_difference('PlatilloPedido.count') do
      post :create, platillo_pedido: { cantidad: @platillo_pedido.cantidad, id_pla_ped: @platillo_pedido.id_pla_ped, pedido: @platillo_pedido.pedido, platillo: @platillo_pedido.platillo }
    end

    assert_redirected_to platillo_pedido_path(assigns(:platillo_pedido))
  end

  test "should show platillo_pedido" do
    get :show, id: @platillo_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @platillo_pedido
    assert_response :success
  end

  test "should update platillo_pedido" do
    patch :update, id: @platillo_pedido, platillo_pedido: { cantidad: @platillo_pedido.cantidad, id_pla_ped: @platillo_pedido.id_pla_ped, pedido: @platillo_pedido.pedido, platillo: @platillo_pedido.platillo }
    assert_redirected_to platillo_pedido_path(assigns(:platillo_pedido))
  end

  test "should destroy platillo_pedido" do
    assert_difference('PlatilloPedido.count', -1) do
      delete :destroy, id: @platillo_pedido
    end

    assert_redirected_to platillo_pedidos_path
  end
end
