require 'test_helper'

class ListloversControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get listlovers_new_url
    assert_response :success
  end

end
