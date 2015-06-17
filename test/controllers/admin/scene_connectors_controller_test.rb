require 'test_helper'

class Admin::SceneConnectorsControllerTest < ActionController::TestCase
  setup do
    @admin_scene_connector = admin_scene_connectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_scene_connectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_scene_connector" do
    assert_difference('Admin::SceneConnector.count') do
      post :create, admin_scene_connector: { position_x: @admin_scene_connector.position_x, position_y: @admin_scene_connector.position_y }
    end

    assert_redirected_to admin_scene_connector_path(assigns(:admin_scene_connector))
  end

  test "should show admin_scene_connector" do
    get :show, id: @admin_scene_connector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_scene_connector
    assert_response :success
  end

  test "should update admin_scene_connector" do
    patch :update, id: @admin_scene_connector, admin_scene_connector: { position_x: @admin_scene_connector.position_x, position_y: @admin_scene_connector.position_y }
    assert_redirected_to admin_scene_connector_path(assigns(:admin_scene_connector))
  end

  test "should destroy admin_scene_connector" do
    assert_difference('Admin::SceneConnector.count', -1) do
      delete :destroy, id: @admin_scene_connector
    end

    assert_redirected_to admin_scene_connectors_path
  end
end
