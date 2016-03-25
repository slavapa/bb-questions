include ApplicationHelper

def full_title(page_title)
  base_title = "Haifa Arvut House"
  if page_title.empty?
    base_title
  else
    "#{page_title} | #{base_title}"
  end
end

def log_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = user.remember
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_digest, User.digest(remember_token))
  else
    visit login_path
    fill_in "session_email",    with: user.email
    fill_in "session_password", with: user.password
    click_button "btn_log_in"
  end
end

def log_test(message)
    Rails.logger.info(message)
    puts message
end

def random_string(length = 8)
  rand(32**length).to_s(32)
end

#
#RSpec::Matchers.define :have_error_message do |message|
#  match do |page|
#    expect(page).to have_selector('div.alert.alert-error', text: message)
#  end
#end
