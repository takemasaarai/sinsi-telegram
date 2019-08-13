require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get dummy" do
    get pages_dummy_url
    assert_response :success
  end

end
