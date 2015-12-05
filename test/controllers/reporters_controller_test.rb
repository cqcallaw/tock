require 'test_helper'

class ReportersControllerTest < ActionController::TestCase
  setup do
    @reporter = reporters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reporters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reporter" do
    assert_difference('Reporter.count') do
      post :create, reporter: { user_id: @reporter.user_id }
    end

    assert_redirected_to reporter_path(assigns(:reporter))
  end

  test "should show reporter" do
    get :show, id: @reporter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reporter
    assert_response :success
  end

  test "should update reporter" do
    patch :update, id: @reporter, reporter: { user_id: @reporter.user_id }
    assert_redirected_to reporter_path(assigns(:reporter))
  end

  test "should destroy reporter" do
    assert_difference('Reporter.count', -1) do
      delete :destroy, id: @reporter
    end

    assert_redirected_to reporters_path
  end
end
