require 'test_helper'

class EmailHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get email_history_new_url
    assert_response :success
  end

end
