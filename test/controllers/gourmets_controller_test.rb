require 'test_helper'

class GourmetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get goulmets_new_url
    assert_response :success
  end

end
