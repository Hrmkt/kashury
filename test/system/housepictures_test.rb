require "application_system_test_case"

class HousepicturesTest < ApplicationSystemTestCase
  setup do
    @housepicture = housepictures(:one)
  end

  test "visiting the index" do
    visit housepictures_url
    assert_selector "h1", text: "Housepictures"
  end

  test "creating a Housepicture" do
    visit housepictures_url
    click_on "New Housepicture"

    fill_in "House", with: @housepicture.house_id
    fill_in "Name", with: @housepicture.name
    fill_in "Photo", with: @housepicture.photo
    click_on "Create Housepicture"

    assert_text "Housepicture was successfully created"
    click_on "Back"
  end

  test "updating a Housepicture" do
    visit housepictures_url
    click_on "Edit", match: :first

    fill_in "House", with: @housepicture.house_id
    fill_in "Name", with: @housepicture.name
    fill_in "Photo", with: @housepicture.photo
    click_on "Update Housepicture"

    assert_text "Housepicture was successfully updated"
    click_on "Back"
  end

  test "destroying a Housepicture" do
    visit housepictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Housepicture was successfully destroyed"
  end
end
