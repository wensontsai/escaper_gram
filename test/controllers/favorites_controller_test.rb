require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  test "should get inde" do
    get :inde
    assert_response :success
  end

end
