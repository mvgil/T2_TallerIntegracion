require 'test_helper'

class HamburguesasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hamburguesa = hamburguesas(:one)
  end

  test "should get index" do
    get hamburguesas_url
    assert_response :success
  end

  test "should get new" do
    get new_hamburguesa_url
    assert_response :success
  end

  test "should create hamburguesa" do
    assert_difference('Hamburguesa.count') do
      post hamburguesas_url, params: { hamburguesa: { descripcion: @hamburguesa.descripcion, nombre: @hamburguesa.nombre, precio: @hamburguesa.precio } }
    end

    assert_redirected_to hamburguesa_url(Hamburguesa.last)
  end

  test "should show hamburguesa" do
    get hamburguesa_url(@hamburguesa)
    assert_response :success
  end

  test "should get edit" do
    get edit_hamburguesa_url(@hamburguesa)
    assert_response :success
  end

  test "should update hamburguesa" do
    patch hamburguesa_url(@hamburguesa), params: { hamburguesa: { descripcion: @hamburguesa.descripcion, nombre: @hamburguesa.nombre, precio: @hamburguesa.precio } }
    assert_redirected_to hamburguesa_url(@hamburguesa)
  end

  test "should destroy hamburguesa" do
    assert_difference('Hamburguesa.count', -1) do
      delete hamburguesa_url(@hamburguesa)
    end

    assert_redirected_to hamburguesas_url
  end
end
