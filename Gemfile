# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'dotenv-rails'
gem 'draper'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'glyphicons-rails', '~> 0.1.2'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'faker', '~> 2.11'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 4.0.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
