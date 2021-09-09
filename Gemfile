# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
# gem 'faraday', '~> 1.4.3'
# gem 'grape', '~> 1.5.3'
# gem 'grape-entity', '~> 0.9.0'
# gem 'grape_on_rails_routes'
# gem 'grape-swagger', '~> 1.4.0'
# gem 'grape-swagger-entity', '~> 0.5.1'
# gem 'grape-swagger-rails', '~> 0.3.1'
gem 'pg', '~> 1.1'
# gem 'pg_search', '~> 2.3'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1.1', require: 'rack/cors'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# gem 'rtesseract', '~> 3.1', '>= 3.1.2'
gem 'tzinfo-data', '~> 1.2021.1', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.18.0'
  gem 'rspec', '~> 3.10.0'
  gem 'rspec-rails', '~> 5.0.1'
  # gem 'rubocop', '~> 1.16.0'
  # gem 'rubocop-performance', '~> 1.11.3'
  # gem 'rubocop-rails', '~> 2.10.1'
  # gem 'rubocop-rspec', '~> 2.3.0'
  # gem 'simplecov', '~> 0.21.2', require: false
  # gem 'webmock', '~> 3.13.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring', '~> 2.1.1'
end
