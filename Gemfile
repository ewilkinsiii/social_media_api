source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"
gem "rails", "~> 7.0.6"

gem 'active_model_serializers', '~> 0.10.14'
gem 'active_storage_base64', '~> 2.0.0'
gem 'activerecord-cockroachdb-adapter', '~> 7.0', '>= 7.0.3'
gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'devise_token_auth', '~> 1.2.2'
gem 'jbuilder', '~> 2.10'
gem 'kaminari'
gem 'lograge', '~> 0.13'
gem 'octokit', '~> 7.2'
gem 'oj', '~> 3.16' 
gem 'omniauth-github', '~> 2.0', '>= 2.0.1'
gem "puma", "~> 5.0"
gem 'rack-cors', '~> 2.0'
gem 'sidekiq', '~> 7.1', '>= 7.1.6'



gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false


group :development, :test do
  gem 'annotate', '~> 3.2', '>= 3.0.3'
  gem 'dotenv-rails', '~> 2.8.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.2'
  gem 'knapsack', '~> 4.0'
  gem 'parallel_tests', '~> 4.3'
  gem 'pry-byebug', '~> 3.9', platform: :mri
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec_api_documentation', '~> 6.1.0'
  gem 'rspec-rails', '~> 6.0'
end

group :development do
  gem 'better_errors', '~> 2.10'
  gem 'binding_of_caller', '~> 1.0'
  gem 'brakeman', '~> 6.0'
  gem 'i18n-tasks', '~> 1.0.12'
  gem 'letter_opener', '~> 1.7'
  gem 'listen', '~> 3.8'
  gem 'rails_best_practices', '~> 1.20'
  gem 'reek', '~> 6.1', '>= 6.1.1'
  gem 'rubocop', '~> 1.56', require: false
  gem 'rubocop-factory_bot', '~> 2.24', require: false
  gem 'rubocop-performance', '~> 1.19', require: false
  gem 'rubocop-rails', '~> 2.21', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'rubocop-rspec', '~> 2.24', require: false
  gem 'spring', '~> 4.1'
end

group :test do
  gem 'prosopite', '~> 1.4.1'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0', require: false
  gem 'webmock', '~> 3.19'
end
