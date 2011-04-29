require 'test_helper'

class SentMailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sent_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sent_mail" do
    assert_difference('SentMail.count') do
      post :create, :sent_mail => { }
    end

    assert_redirected_to sent_mail_path(assigns(:sent_mail))
  end

  test "should show sent_mail" do
    get :show, :id => sent_mails(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sent_mails(:one).to_param
    assert_response :success
  end

  test "should update sent_mail" do
    put :update, :id => sent_mails(:one).to_param, :sent_mail => { }
    assert_redirected_to sent_mail_path(assigns(:sent_mail))
  end

  test "should destroy sent_mail" do
    assert_difference('SentMail.count', -1) do
      delete :destroy, :id => sent_mails(:one).to_param
    end

    assert_redirected_to sent_mails_path
  end
end
