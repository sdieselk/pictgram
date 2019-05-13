require 'test_helper'

class TopisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get topis_new_url
    assert_response :success
  end

end
