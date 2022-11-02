require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def login_as(user, password)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in  'user_password', with: password
    click_on 'Log in'
  end
  
  setup do
    @category = categories(:first_category)
    @user = users(:justine)
    login_as(@user, 'justine') 
  end

  test "visit index" do
    assert_selector "p", text: "Categories"
  end

  test "should create a category" do
  
    click_on "Add a category"
  
    fill_in "category[title]", with: "Creating a category"
  
    click_on "Create Category"

    assert_text "A category has been created."
  
    assert_text "Creating a category"
  end

end


