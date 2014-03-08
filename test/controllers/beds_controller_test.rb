require 'test_helper'

class BedsControllerTest < ActionController::TestCase
  setup do
    @bed = beds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bed" do
    assert_difference('Bed.count') do
      post :create, bed: { description: @bed.description, end_date: @bed.end_date, image: @bed.image, max_bookable: @bed.max_bookable, max_days_before: @bed.max_days_before, name: @bed.name, payment_method: @bed.payment_method, price: @bed.price, price: @bed.price, quantity: @bed.quantity, start_date: @bed.start_date, user_id: @bed.user_id }
    end

    assert_redirected_to bed_path(assigns(:bed))
  end

  test "should show bed" do
    get :show, id: @bed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bed
    assert_response :success
  end

  test "should update bed" do
    patch :update, id: @bed, bed: { description: @bed.description, end_date: @bed.end_date, image: @bed.image, max_bookable: @bed.max_bookable, max_days_before: @bed.max_days_before, name: @bed.name, payment_method: @bed.payment_method, price: @bed.price, price: @bed.price, quantity: @bed.quantity, start_date: @bed.start_date, user_id: @bed.user_id }
    assert_redirected_to bed_path(assigns(:bed))
  end

  test "should destroy bed" do
    assert_difference('Bed.count', -1) do
      delete :destroy, id: @bed
    end

    assert_redirected_to beds_path
  end
end
