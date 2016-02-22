require 'test_helper'

class KeyboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get keyboard_show_url
    assert_response :success
  end

end
