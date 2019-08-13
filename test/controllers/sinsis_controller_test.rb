require 'test_helper'

class SinsisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sinsi = sinsis(:one)
  end

  test "should get index" do
    get sinsis_url
    assert_response :success
  end

  test "should get new" do
    get new_sinsi_url
    assert_response :success
  end

  test "should create sinsi" do
    assert_difference('Sinsi.count') do
      post sinsis_url, params: { sinsi: { description: @sinsi.description, picture: @sinsi.picture, title: @sinsi.title } }
    end

    assert_redirected_to sinsi_url(Sinsi.last)
  end

  test "should show sinsi" do
    get sinsi_url(@sinsi)
    assert_response :success
  end

  test "should get edit" do
    get edit_sinsi_url(@sinsi)
    assert_response :success
  end

  test "should update sinsi" do
    patch sinsi_url(@sinsi), params: { sinsi: { description: @sinsi.description, picture: @sinsi.picture, title: @sinsi.title } }
    assert_redirected_to sinsi_url(@sinsi)
  end

  test "should destroy sinsi" do
    assert_difference('Sinsi.count', -1) do
      delete sinsi_url(@sinsi)
    end

    assert_redirected_to sinsis_url
  end
end
