require "test_helper"

class SkillshareControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get skillshare_new_url
    assert_response :success
  end

  test "should get index" do
    get skillshare_index_url
    assert_response :success
  end

  test "should get show" do
    get skillshare_show_url
    assert_response :success
  end

  test "should get edit" do
    get skillshare_edit_url
    assert_response :success
  end
end
