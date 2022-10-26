require "test_helper"

class HousepicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @housepicture = housepictures(:one)
  end

  test "should get index" do
    get housepictures_url
    assert_response :success
  end

  test "should get new" do
    get new_housepicture_url
    assert_response :success
  end

  test "should create housepicture" do
    assert_difference('Housepicture.count') do
      post housepictures_url, params: { housepicture: { house_id: @housepicture.house_id, name: @housepicture.name, photo: @housepicture.photo } }
    end

    assert_redirected_to housepicture_url(Housepicture.last)
  end

  test "should show housepicture" do
    get housepicture_url(@housepicture)
    assert_response :success
  end

  test "should get edit" do
    get edit_housepicture_url(@housepicture)
    assert_response :success
  end

  test "should update housepicture" do
    patch housepicture_url(@housepicture), params: { housepicture: { house_id: @housepicture.house_id, name: @housepicture.name, photo: @housepicture.photo } }
    assert_redirected_to housepicture_url(@housepicture)
  end

  test "should destroy housepicture" do
    assert_difference('Housepicture.count', -1) do
      delete housepicture_url(@housepicture)
    end

    assert_redirected_to housepictures_url
  end
end
