require "test_helper"
require "capybara/cuprite"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400] 
  # driven_by :cuprite
  def login_as(user, password)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in  'user_password', with: password
    click_on 'Log in'
  end
end

