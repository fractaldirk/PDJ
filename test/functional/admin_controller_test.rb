require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get Activity" do
    get :Activity
    assert_response :success
  end

end
