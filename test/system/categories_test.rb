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
    visit categories_url
    assert_selector "p", text: "Categories"
  end

  test "should create a category" do
    visit categories_url
    click_on "Add a category"
    fill_in "category[title]", with: "Creating a category"
    click_on "Create Category"
    assert_text "A category has been created."
    assert_text "Creating a category"
  end

  test "showing a category" do
    visit categories_url
    Capybara.page.find('.category-name').click
    assert_text "You have no task.."
  end

  test "Update a category" do
    visit categories_url
    Capybara.page.find('.category-name').click
    Capybara.page.find('.category-links-edit').click match: :first
    fill_in "category[title]", with: "Updated"
    click_on "Update Category"
    assert_text "A category has been updated."
    assert_text "Updated"
  end

  test "Delete a category" do
    Capybara.page.find('.category-name').click
    page.accept_confirm do
      Capybara.page.find('.category-links-delete').click
    end
    assert_text "A category has been deleted."
  end
end



