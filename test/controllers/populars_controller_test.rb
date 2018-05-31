require 'test_helper'

class PopularsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get populars_new_url
    assert_response :success
  end

end
