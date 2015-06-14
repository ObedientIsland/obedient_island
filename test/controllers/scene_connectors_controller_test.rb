require 'test_helper'

class SceneConnectorsControllerTest < ActionController::TestCase
  setup do
    @scene_connector = scene_connectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene_connectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene_connector" do
    assert_difference('SceneConnector.count') do
      post :create, scene_connector: {  }
    end

    assert_redirected_to scene_connector_path(assigns(:scene_connector))
  end

  test "should show scene_connector" do
    get :show, id: @scene_connector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene_connector
    assert_response :success
  end

  test "should update scene_connector" do
    patch :update, id: @scene_connector, scene_connector: {  }
    assert_redirected_to scene_connector_path(assigns(:scene_connector))
  end

  test "should destroy scene_connector" do
    assert_difference('SceneConnector.count', -1) do
      delete :destroy, id: @scene_connector
    end

    assert_redirected_to scene_connectors_path
  end
end
