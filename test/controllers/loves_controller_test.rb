require 'test_helper'

class LovesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get loves_new_url
    assert_response :success
  end

end
