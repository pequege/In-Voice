require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { bill_to_address: @order.bill_to_address, bill_to_email: @order.bill_to_email, bill_to_name: @order.bill_to_name, bill_to_org: @order.bill_to_org, date: @order.date, extra_notes: @order.extra_notes, extra_others: @order.extra_others }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { bill_to_address: @order.bill_to_address, bill_to_email: @order.bill_to_email, bill_to_name: @order.bill_to_name, bill_to_org: @order.bill_to_org, date: @order.date, extra_notes: @order.extra_notes, extra_others: @order.extra_others }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
