require 'test_helper'

class ReceptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reception" do
    assert_difference('Reception.count') do
      post :create, :reception => { }
    end

    assert_redirected_to reception_path(assigns(:reception))
  end

  test "should show reception" do
    get :show, :id => receptions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => receptions(:one).to_param
    assert_response :success
  end

  test "should update reception" do
    put :update, :id => receptions(:one).to_param, :reception => { }
    assert_redirected_to reception_path(assigns(:reception))
  end

  test "should destroy reception" do
    assert_difference('Reception.count', -1) do
      delete :destroy, :id => receptions(:one).to_param
    end

    assert_redirected_to receptions_path
  end
end
