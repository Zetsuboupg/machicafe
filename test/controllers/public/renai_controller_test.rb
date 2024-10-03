require "test_helper"

class Public::RenaiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_renai_index_url
    assert_response :success
  end

  test "should get new" do
    get public_renai_new_url
    assert_response :success
  end

  test "should get create" do
    get public_renai_create_url
    assert_response :success
  end

  test "should get show" do
    get public_renai_show_url
    assert_response :success
  end
end
