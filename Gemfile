source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jquery-rails'
gem 'faraday'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'figaro'
gem 'geocoder'
gem 'devise'

group :development, :test do
  gem 'pry'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem "factory_bot_rails"
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov'
  gem 'coveralls', require: false
  gem 'travis'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
