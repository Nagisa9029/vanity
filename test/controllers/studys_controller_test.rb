require 'test_helper'

class StudysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get studys_new_url
    assert_response :success
  end

end
