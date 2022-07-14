require "test_helper"

class BlindDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blind_date = blind_dates(:one)
  end

  test "should get index" do
    get blind_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_blind_date_url
    assert_response :success
  end

  test "should create blind_date" do
    assert_difference("BlindDate.count") do
      post blind_dates_url, params: { blind_date: { data: @blind_date.data } }
    end

    assert_redirected_to blind_date_url(BlindDate.last)
  end

  test "should show blind_date" do
    get blind_date_url(@blind_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_blind_date_url(@blind_date)
    assert_response :success
  end

  test "should update blind_date" do
    patch blind_date_url(@blind_date), params: { blind_date: { data: @blind_date.data } }
    assert_redirected_to blind_date_url(@blind_date)
  end

  test "should destroy blind_date" do
    assert_difference("BlindDate.count", -1) do
      delete blind_date_url(@blind_date)
    end

    assert_redirected_to blind_dates_url
  end
end
