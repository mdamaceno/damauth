source 'https://rubygems.org'

# Declare your gem's dependencies in damauth.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'pg'
gem 'ar-uuid'
gem 'friendly_id', '~> 5.1.0'
gem 'dry-validation'
gem 'slugify'
gem 'bcrypt', require: 'bcrypt'

group :development, :test do
  gem 'byebug'
  gem 'faker'
  gem 'factory_girl_rails'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'shoulda-kept-respond-with-content-type'
  gem 'capybara'
  gem 'brakeman', require: false
end
