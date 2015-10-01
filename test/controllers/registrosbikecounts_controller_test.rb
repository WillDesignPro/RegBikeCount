require 'test_helper'

class RegistrosbikecountsControllerTest < ActionController::TestCase
  setup do
    @registrosbikecount = registrosbikecounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrosbikecounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registrosbikecount" do
    assert_difference('Registrosbikecount.count') do
      post :create, registrosbikecount: { ciclista: @registrosbikecount.ciclista, dia: @registrosbikecount.dia, hora: @registrosbikecount.hora, pedestre: @registrosbikecount.pedestre, velocidade: @registrosbikecount.velocidade }
    end

    assert_redirected_to registrosbikecount_path(assigns(:registrosbikecount))
  end

  test "should show registrosbikecount" do
    get :show, id: @registrosbikecount
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registrosbikecount
    assert_response :success
  end

  test "should update registrosbikecount" do
    patch :update, id: @registrosbikecount, registrosbikecount: { ciclista: @registrosbikecount.ciclista, dia: @registrosbikecount.dia, hora: @registrosbikecount.hora, pedestre: @registrosbikecount.pedestre, velocidade: @registrosbikecount.velocidade }
    assert_redirected_to registrosbikecount_path(assigns(:registrosbikecount))
  end

  test "should destroy registrosbikecount" do
    assert_difference('Registrosbikecount.count', -1) do
      delete :destroy, id: @registrosbikecount
    end

    assert_redirected_to registrosbikecounts_path
  end
end
