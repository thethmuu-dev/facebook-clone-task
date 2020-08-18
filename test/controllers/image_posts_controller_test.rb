require 'test_helper'

class ImagePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_post = image_posts(:one)
  end

  test "should get index" do
    get image_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_image_post_url
    assert_response :success
  end

  test "should create image_post" do
    assert_difference('ImagePost.count') do
      post image_posts_url, params: { image_post: { content: @image_post.content, picture: @image_post.picture, user_id: @image_post.user_id } }
    end

    assert_redirected_to image_post_url(ImagePost.last)
  end

  test "should show image_post" do
    get image_post_url(@image_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_post_url(@image_post)
    assert_response :success
  end

  test "should update image_post" do
    patch image_post_url(@image_post), params: { image_post: { content: @image_post.content, picture: @image_post.picture, user_id: @image_post.user_id } }
    assert_redirected_to image_post_url(@image_post)
  end

  test "should destroy image_post" do
    assert_difference('ImagePost.count', -1) do
      delete image_post_url(@image_post)
    end

    assert_redirected_to image_posts_url
  end
end
