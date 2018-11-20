require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get user_register_url
    assert_response :success
  end

  test "should get login" do
    get user_login_url
    assert_response :success
  end

  test "should get logout" do
    get user_logout_url
    assert_response :success
  end

end
