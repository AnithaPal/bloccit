source 'https://rubygems.org'
ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# adding pry irb gem
gem 'pry-rails'
# Use sqlite3 as the database for Active Record
group :production do
   gem 'pg'
   gem 'rails_12factor'
 end
 
 group :development do
   gem 'sqlite3'
 end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# adding bootstrap framework to application
gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Adding faker gem to add deve data automatically
gem 'faker'

# Adding device to authenticate users
gem 'devise'

# Adding Figaro to handle sensitive data
gem 'figaro'

# Adding pundit to authorize users
gem 'pundit'

#To gt mark down text fomat support
gem 'redcarpet'

#To upload images to ruby application
gem 'carrierwave'
#To manipulate images
gem 'mini_magick'

# To help to store uploaded files in S3
gem 'fog'

# To organize content and make pages of content

gem 'will_paginate', '~> 3.0.5'

# Help to create objects in tests
gem 'factory_girl_rails', '~> 4.0'

# To monitor performance
gem 'newrelic_rpm'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# for better error description and display
gem 'better_errors'
gem 'binding_of_caller'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  #To automate testing our code 
  gem 'rspec-rails', '~> 3.0'
  #To automate feature testing
  gem 'capybara'
end

