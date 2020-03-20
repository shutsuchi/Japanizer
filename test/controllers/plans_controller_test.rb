require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get plans_edit_url
    assert_response :success
  end

end
