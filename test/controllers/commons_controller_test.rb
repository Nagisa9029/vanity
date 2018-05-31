require 'test_helper'

class CommonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get commons_new_url
    assert_response :success
  end

end
