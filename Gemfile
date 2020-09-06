source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # For Display schema on model-file
  gem 'annotate'
  # and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Call 'byebug' anywhere in the code to stop execution,
  gem 'pry-byebug'
  gem 'pry-rails'
  # For Readable-code
  gem 'rubocop', '~> 0.80.1', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  # Access an interactive console on exception pages
  # or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running,
  # in the background. Read more: https://github.com/rails/spring
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'factory_bot_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# For UserFunc
gem 'devise', '~> 4.7.1'

# For PagingFunc
gem 'kaminari', '~> 1.2.1'

### Refile
# For File Upload
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
# For Resize Image Uploaded
gem 'refile-mini_magick'

# Bootstrap v3
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'

# ENV-mng
gem 'dotenv-rails', '~> 2.7.5'

# Google-map
gem 'geocoder', '~> 1.6.2'

# For SearchFunc
gem 'ransack', '~> 2.3.2'

# For Logical-deletion
gem 'paranoia', '~> 2.4.2'
# For calenderFunc
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'fullcalendar-rails', '~> 3.9.0.0'
gem 'momentjs-rails'

# For Internationalization
gem 'rails-i18n', '~> 5.1.3'
# For Internationalization(javascript)
gem 'i18n-js'

### For Management
# For Authority-mng
gem 'cancancan', '~> 3.1.0'
# For Admin-browser
gem 'rails_admin', '~> 2.0.2'

### Template-Engine
gem 'slim-rails', '~> 3.2.0'
# change html.erb into html.slim
gem 'html2slim', '~> 0.2.0'

# Country & Area-name
gem 'carmen-rails', git: 'https://github.com/Studiosity/carmen-rails.git', branch: 'master'
