require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pictures_create_url
    assert_response :success
  end

  test "should get udpate" do
    get pictures_udpate_url
    assert_response :success
  end

  test "should get destroy" do
    get pictures_destroy_url
    assert_response :success
  end

end
