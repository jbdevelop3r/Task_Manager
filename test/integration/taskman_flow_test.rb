require "test_helper"

class TaskmanFlowTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  def setup
    sign_in users(:one)
    @category = categories(:one)
  end

  test "can create a category" do
    get "/categories/new"
    assert_response :success

    post "/categories",
    params: { category: { title: "can create"} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    # assert_select "div", "can create"
  end

  # test "can edit a category" do
  #   get "/categories/new"
    
  #   assert_response :success

  #   post "/categories",
  #   params: { category: { title: "can create"} }
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success
  #   # assert_select "div", "can create"
  # end
end
