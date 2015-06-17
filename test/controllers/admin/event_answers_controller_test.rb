require 'test_helper'

class Admin::EventAnswersControllerTest < ActionController::TestCase
  setup do
    @admin_event_answer = admin_event_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_event_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_event_answer" do
    assert_difference('Admin::EventAnswer.count') do
      post :create, admin_event_answer: { answer: @admin_event_answer.answer, next_id: @admin_event_answer.next_id, next_type: @admin_event_answer.next_type }
    end

    assert_redirected_to admin_event_answer_path(assigns(:admin_event_answer))
  end

  test "should show admin_event_answer" do
    get :show, id: @admin_event_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_event_answer
    assert_response :success
  end

  test "should update admin_event_answer" do
    patch :update, id: @admin_event_answer, admin_event_answer: { answer: @admin_event_answer.answer, next_id: @admin_event_answer.next_id, next_type: @admin_event_answer.next_type }
    assert_redirected_to admin_event_answer_path(assigns(:admin_event_answer))
  end

  test "should destroy admin_event_answer" do
    assert_difference('Admin::EventAnswer.count', -1) do
      delete :destroy, id: @admin_event_answer
    end

    assert_redirected_to admin_event_answers_path
  end
end
