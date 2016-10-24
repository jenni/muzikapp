require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get songs_index_url
    assert_response :success
  end

  test "should get upload" do
    get songs_upload_url
    assert_response :success
  end

  test "should get delete" do
    get songs_delete_url
    assert_response :success
  end

end
