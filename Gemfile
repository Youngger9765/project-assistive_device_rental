source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'bootstrap-sass', '~> 3.3.5'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'

gem 'devise'
gem 'activeadmin'
gem "rolify"
gem 'cancancan', '~> 2.0'

gem 'mysql2', '~> 0.3.18'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'letter_opener_web'

  gem "capistrano",  "~> 3.1", require: false
  gem "capistrano-rvm", "~> 0.1.1", require: false
  gem "capistrano-rails", "~> 1.1", require: false
  gem "capistrano-rbenv", "~> 2.0", require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
