require 'test_helper'

class EventAnswersControllerTest < ActionController::TestCase
  setup do
    @event_answer = event_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_answer" do
    assert_difference('EventAnswer.count') do
      post :create, event_answer: { answer: @event_answer.answer, next_id: @event_answer.next_id, next_type: @event_answer.next_type }
    end

    assert_redirected_to event_answer_path(assigns(:event_answer))
  end

  test "should show event_answer" do
    get :show, id: @event_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_answer
    assert_response :success
  end

  test "should update event_answer" do
    patch :update, id: @event_answer, event_answer: { answer: @event_answer.answer, next_id: @event_answer.next_id, next_type: @event_answer.next_type }
    assert_redirected_to event_answer_path(assigns(:event_answer))
  end

  test "should destroy event_answer" do
    assert_difference('EventAnswer.count', -1) do
      delete :destroy, id: @event_answer
    end

    assert_redirected_to event_answers_path
  end
end
