source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# The administration framework for Ruby on Rails applications.
gem 'activeadmin', '~> 2.13'

# The Ruby barcode generator
gem 'barby', '~> 0.6.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Flexible authentication solution for Rails with Warden.
gem 'devise', '~> 4.8'

# Translations for the devise gem
gem 'devise-i18n', '~> 1.10'

# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker', '~> 2.19'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt', '~> 2.4'

# Translations for the kaminari gem
gem 'kaminari-i18n', '~> 0.5.0'

# Pg is the Ruby interface to the PostgreSQL RDBMS. It works with PostgreSQL 9.3 and later.
gem 'pg', '~> 1.2'

# Use Puma as the app server
gem 'puma', '~> 5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'

# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff
gem 'rails-i18n', '~> 6.0'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# RMagick is an interface between Ruby and ImageMagick.
gem 'rmagick', '~> 4.2'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Slim templates generator for Rails
gem 'slim-rails', '~> 3.3'

# A modest JavaScript framework for the HTML you already have.
gem 'stimulus-rails', '~> 1.0'

# The speed of a single-page web application without having to write any JavaScript.
gem 'turbo-rails', '~> 1.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

