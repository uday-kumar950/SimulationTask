require "application_system_test_case"

class BlindDatesTest < ApplicationSystemTestCase
  setup do
    @blind_date = blind_dates(:one)
  end

  test "visiting the index" do
    visit blind_dates_url
    assert_selector "h1", text: "Blind dates"
  end

  test "should create blind date" do
    visit blind_dates_url
    click_on "New blind date"

    fill_in "Data", with: @blind_date.data
    click_on "Create Blind date"

    assert_text "Blind date was successfully created"
    click_on "Back"
  end

  test "should update Blind date" do
    visit blind_date_url(@blind_date)
    click_on "Edit this blind date", match: :first

    fill_in "Data", with: @blind_date.data
    click_on "Update Blind date"

    assert_text "Blind date was successfully updated"
    click_on "Back"
  end

  test "should destroy Blind date" do
    visit blind_date_url(@blind_date)
    click_on "Destroy this blind date", match: :first

    assert_text "Blind date was successfully destroyed"
  end
end
