require "test_helper"

class MemoControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get memo_edit_url
    assert_response :success
  end

  test "should get update" do
    get memo_update_url
    assert_response :success
  end
end
