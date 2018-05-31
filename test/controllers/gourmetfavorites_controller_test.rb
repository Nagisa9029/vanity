require 'test_helper'

class GourmetfavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gourmentfavorites_new_url
    assert_response :success
  end

end
