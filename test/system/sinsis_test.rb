require "application_system_test_case"

class SinsisTest < ApplicationSystemTestCase
  setup do
    @sinsi = sinsis(:one)
  end

  test "visiting the index" do
    visit sinsis_url
    assert_selector "h1", text: "Sinsis"
  end

  test "creating a Sinsi" do
    visit sinsis_url
    click_on "New Sinsi"

    fill_in "Description", with: @sinsi.description
    fill_in "Picture", with: @sinsi.picture
    fill_in "Title", with: @sinsi.title
    click_on "Create Sinsi"

    assert_text "Sinsi was successfully created"
    click_on "Back"
  end

  test "updating a Sinsi" do
    visit sinsis_url
    click_on "Edit", match: :first

    fill_in "Description", with: @sinsi.description
    fill_in "Picture", with: @sinsi.picture
    fill_in "Title", with: @sinsi.title
    click_on "Update Sinsi"

    assert_text "Sinsi was successfully updated"
    click_on "Back"
  end

  test "destroying a Sinsi" do
    visit sinsis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sinsi was successfully destroyed"
  end
end
