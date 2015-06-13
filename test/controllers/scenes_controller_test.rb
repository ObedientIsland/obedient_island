require 'test_helper'

class ScenesControllerTest < ActionController::TestCase
  test "should get scene" do
    get :scene
    assert_response :success
  end

end
