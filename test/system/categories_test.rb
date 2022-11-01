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
  
    fill_in "category[title]", with: "Creating a Category"
  
    click_on "Create Category"
  
    assert_text "Creating a Category"
  end

  test "should edit a category" do
    require "pry"

    visit categories_path
  

    # binding.pry

    find('a[href="/categories/1"]').click

    find('a[href="/categories/1/edit"]').click
  
    fill_in "category[title]", with: "Updating a Category"
  
    click_on "commit"
    
    assert_text "Updating a Category"
  
  end

end


