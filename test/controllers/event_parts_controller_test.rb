require 'test_helper'

class EventPartsControllerTest < ActionController::TestCase
  setup do
    @event_part = event_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_part" do
    assert_difference('EventPart.count') do
      post :create, event_part: {  }
    end

    assert_redirected_to event_part_path(assigns(:event_part))
  end

  test "should show event_part" do
    get :show, id: @event_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_part
    assert_response :success
  end

  test "should update event_part" do
    patch :update, id: @event_part, event_part: {  }
    assert_redirected_to event_part_path(assigns(:event_part))
  end

  test "should destroy event_part" do
    assert_difference('EventPart.count', -1) do
      delete :destroy, id: @event_part
    end

    assert_redirected_to event_parts_path
  end
end
