require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase

  setup do 
    @task = tasks(:one)
    @user = users(:justine)
    login_as(@user, 'justine')
  end
 
  def login_as(user, password)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in  'user_password', with: password
    click_on 'Log in'
    assert_text "Hello, justinebanogon14@gmail.com!"
  end

  test "creating a new Task" do
    visit categories_url
    Capybara.page.find('.category-name').click
    Capybara.page.find('.category-links-add-task').click

    fill_in "task[task]", with: "first task"
    fill_in "task[details]", with: "first detail"
    fill_in "task[deadline]", with: @task.deadline
    click_on "Create Task"

    assert_text "A task has been created."
    assert_text "first task"
  end

  test "show a task" do
    visit categories_url

    Capybara.page.find('.category-name').click
    Capybara.page.find('.t-links-show-task').click   
  end

  test "edit a task" do
    visit categories_url

    Capybara.page.find('.category-name').click
    Capybara.page.find('.t-links-edit-task').click 

    fill_in "task[task]", with: "update task"
    fill_in "task[details]", with: "update detail"
    fill_in "task[deadline]", with: @task.deadline
    click_on "Update Task"

    assert_text "A task has been updated."
    assert_text "update task"
  end

  test "delete a task" do
    visit categories_url

    Capybara.page.find('.category-name').click
    page.accept_confirm do
      Capybara.page.find('.t-links-delete-task').click
    end
    
    assert_text "A task has been deleted."
    assert_text "No task under this category."
  end
end
