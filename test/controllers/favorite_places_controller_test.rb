require 'test_helper'

class FavoritePlacesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
