require 'test_helper'

class DetailsControllerTest < ActionController::TestCase
  setup do
    @detail = details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail" do
    assert_difference('Detail.count') do
      post :create, detail: { order_id: @detail.order_id, project: @detail.project }
    end

    assert_redirected_to detail_path(assigns(:detail))
  end

  test "should show detail" do
    get :show, id: @detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail
    assert_response :success
  end

  test "should update detail" do
    patch :update, id: @detail, detail: { order_id: @detail.order_id, project: @detail.project }
    assert_redirected_to detail_path(assigns(:detail))
  end

  test "should destroy detail" do
    assert_difference('Detail.count', -1) do
      delete :destroy, id: @detail
    end

    assert_redirected_to details_path
  end
end
