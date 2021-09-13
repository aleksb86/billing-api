# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1.1', require: 'rack/cors'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'tzinfo-data', '~> 1.2021.1', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner-active_record', '~> 2.0', '>= 2.0.1'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.18.0'
  gem 'json-schema', '~> 2.8', '>= 2.8.1'
  gem 'rspec', '~> 3.10.0'
  gem 'rspec-rails', '~> 5.0.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring', '~> 2.1.1'
end
