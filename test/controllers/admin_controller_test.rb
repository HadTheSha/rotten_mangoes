require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get users_controller" do
    get admin_users_controller_url
    assert_response :success
  end

end
