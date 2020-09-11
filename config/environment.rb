# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['USER_LOGIN'],
  :password => ENV['USER_PWD'],
  :domain => 'cat-store.com',
  :address => ENV['ADDRESS'],
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
