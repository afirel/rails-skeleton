source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Postgresql for use with Active Record
gem 'pg'

# Use sqlite3?
# gem 'sqlite3'

group :assets do
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 4.0.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'

  # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails', '~> 4.0.0'
end

gem 'bootstrap-sass', '~> 2.3.2.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

gem 'unicorn'
gem 'thin'

# Use Capistrano for deployment
gem 'capistrano'
gem 'rvm-capistrano'

# Use debugger
group :development, :test do
  gem 'debugger'
end

group :development do
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'ruby_gntp'
  gem 'pry-rails'

  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'simplecov'
  gem 'fuubar'
end
