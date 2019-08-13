require 'test_helper'

class SliclaControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get slicla_contact_url
    assert_response :success
  end

end
