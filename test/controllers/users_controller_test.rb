require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get users_new,_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

end
