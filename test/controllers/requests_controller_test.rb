require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get rails" do
    get requests_rails_url
    assert_response :success
  end

  test "should get s" do
    get requests_s_url
    assert_response :success
  end
end
