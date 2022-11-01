require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  def setup
    sign_in users(:one)
    @category = categories(:one)
    @user = users(:one)
  end


  test "should create a category" do
    visit categories_path
  
    click_on "Add a category"
  
    fill_in "category[title]", with: "Creating a category"
  
    click_on "Create Category"
  
    assert_text "Creating a category"
  end
end


