require 'test_helper'

class GourmetcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gourmentcomments_new_url
    assert_response :success
  end

end
