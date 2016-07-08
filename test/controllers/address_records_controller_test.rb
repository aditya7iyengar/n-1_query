require 'test_helper'

class AddressRecordsControllerTest < ActionController::TestCase
  setup do
    @address_record = address_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_record" do
    assert_difference('AddressRecord.count') do
      post :create, address_record: {  }
    end

    assert_redirected_to address_record_path(assigns(:address_record))
  end

  test "should show address_record" do
    get :show, id: @address_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address_record
    assert_response :success
  end

  test "should update address_record" do
    patch :update, id: @address_record, address_record: {  }
    assert_redirected_to address_record_path(assigns(:address_record))
  end

  test "should destroy address_record" do
    assert_difference('AddressRecord.count', -1) do
      delete :destroy, id: @address_record
    end

    assert_redirected_to address_records_path
  end
end
