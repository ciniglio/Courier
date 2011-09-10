require 'test_helper'

class ParcelControllerTest < ActionController::TestCase
  test "should get send" do
    get :send
    assert_response :success
  end

  test "should get recieve" do
    get :recieve
    assert_response :success
  end

end
