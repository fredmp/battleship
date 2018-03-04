source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'bcrypt', '~> 3.1.7'
gem 'fast_jsonapi'
gem 'rack-cors'
gem 'figaro'
gem 'redis'
gem 'redis-namespace'

group :development, :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'awesome_print'
  gem 'pry-byebug'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
end

group :development do
  gem 'capistrano-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'bundler-audit'
  gem 'brakeman'
  gem 'annotate'
end
