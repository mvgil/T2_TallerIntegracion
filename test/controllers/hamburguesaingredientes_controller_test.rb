require 'test_helper'

class HamburguesaingredientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hamburguesaingrediente = hamburguesaingredientes(:one)
  end

  test "should get index" do
    get hamburguesaingredientes_url
    assert_response :success
  end

  test "should get new" do
    get new_hamburguesaingrediente_url
    assert_response :success
  end

  test "should create hamburguesaingrediente" do
    assert_difference('Hamburguesaingrediente.count') do
      post hamburguesaingredientes_url, params: { hamburguesaingrediente: { id_hamburguesa: @hamburguesaingrediente.id_hamburguesa, id_ingrediente: @hamburguesaingrediente.id_ingrediente } }
    end

    assert_redirected_to hamburguesaingrediente_url(Hamburguesaingrediente.last)
  end

  test "should show hamburguesaingrediente" do
    get hamburguesaingrediente_url(@hamburguesaingrediente)
    assert_response :success
  end

  test "should get edit" do
    get edit_hamburguesaingrediente_url(@hamburguesaingrediente)
    assert_response :success
  end

  test "should update hamburguesaingrediente" do
    patch hamburguesaingrediente_url(@hamburguesaingrediente), params: { hamburguesaingrediente: { id_hamburguesa: @hamburguesaingrediente.id_hamburguesa, id_ingrediente: @hamburguesaingrediente.id_ingrediente } }
    assert_redirected_to hamburguesaingrediente_url(@hamburguesaingrediente)
  end

  test "should destroy hamburguesaingrediente" do
    assert_difference('Hamburguesaingrediente.count', -1) do
      delete hamburguesaingrediente_url(@hamburguesaingrediente)
    end

    assert_redirected_to hamburguesaingredientes_url
  end
end
