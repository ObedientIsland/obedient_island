require 'test_helper'

class Admin::ScenesControllerTest < ActionController::TestCase
  setup do
    @admin_scene = admin_scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_scene" do
    assert_difference('Admin::Scene.count') do
      post :create, admin_scene: { name: @admin_scene.name }
    end

    assert_redirected_to admin_scene_path(assigns(:admin_scene))
  end

  test "should show admin_scene" do
    get :show, id: @admin_scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_scene
    assert_response :success
  end

  test "should update admin_scene" do
    patch :update, id: @admin_scene, admin_scene: { name: @admin_scene.name }
    assert_redirected_to admin_scene_path(assigns(:admin_scene))
  end

  test "should destroy admin_scene" do
    assert_difference('Admin::Scene.count', -1) do
      delete :destroy, id: @admin_scene
    end

    assert_redirected_to admin_scenes_path
  end
end
