require 'test_helper'

class ProductoPlatillosControllerTest < ActionController::TestCase
  setup do
    @producto_platillo = producto_platillos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producto_platillos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producto_platillo" do
    assert_difference('ProductoPlatillo.count') do
      post :create, producto_platillo: { cantidad: @producto_platillo.cantidad, id_pro_pla: @producto_platillo.id_pro_pla, platillo: @producto_platillo.platillo, producto: @producto_platillo.producto, unidad_medida: @producto_platillo.unidad_medida }
    end

    assert_redirected_to producto_platillo_path(assigns(:producto_platillo))
  end

  test "should show producto_platillo" do
    get :show, id: @producto_platillo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @producto_platillo
    assert_response :success
  end

  test "should update producto_platillo" do
    patch :update, id: @producto_platillo, producto_platillo: { cantidad: @producto_platillo.cantidad, id_pro_pla: @producto_platillo.id_pro_pla, platillo: @producto_platillo.platillo, producto: @producto_platillo.producto, unidad_medida: @producto_platillo.unidad_medida }
    assert_redirected_to producto_platillo_path(assigns(:producto_platillo))
  end

  test "should destroy producto_platillo" do
    assert_difference('ProductoPlatillo.count', -1) do
      delete :destroy, id: @producto_platillo
    end

    assert_redirected_to producto_platillos_path
  end
end
