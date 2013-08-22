require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get successful_requests" do
    get :successful_requests
    assert_response :success
  end

end
