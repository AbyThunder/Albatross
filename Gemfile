# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'active_model_serializers'
gem 'bootsnap', require: false
gem 'cancancan'
gem 'devise'
gem 'dotenv-rails'
gem 'faker'
gem 'fast_jsonapi'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.2'
gem 'sprockets-rails'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop', '~> 1.35.0'
  gem 'rubocop-performance', '~> 1.14.3'
  gem 'rubocop-rails', '~> 2.14.2'
  gem 'rubocop-rspec', '~> 2.8'
end

group :development do
  gem 'spring'
  gem 'web-console'
end

group :test do
  # gem "capybara"
  # gem "selenium-webdriver"
  # gem "webdrivers"
  # gem 'dotenv-rails'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
