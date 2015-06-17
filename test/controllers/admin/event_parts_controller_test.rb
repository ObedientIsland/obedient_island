require 'test_helper'

class Admin::EventPartsControllerTest < ActionController::TestCase
  setup do
    @admin_event_part = admin_event_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_event_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_event_part" do
    assert_difference('Admin::EventPart.count') do
      post :create, admin_event_part: { next_id: @admin_event_part.next_id, next_type: @admin_event_part.next_type, text: @admin_event_part.text, title: @admin_event_part.title }
    end

    assert_redirected_to admin_event_part_path(assigns(:admin_event_part))
  end

  test "should show admin_event_part" do
    get :show, id: @admin_event_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_event_part
    assert_response :success
  end

  test "should update admin_event_part" do
    patch :update, id: @admin_event_part, admin_event_part: { next_id: @admin_event_part.next_id, next_type: @admin_event_part.next_type, text: @admin_event_part.text, title: @admin_event_part.title }
    assert_redirected_to admin_event_part_path(assigns(:admin_event_part))
  end

  test "should destroy admin_event_part" do
    assert_difference('Admin::EventPart.count', -1) do
      delete :destroy, id: @admin_event_part
    end

    assert_redirected_to admin_event_parts_path
  end
end
