source "https://rubygems.org"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Sinatra
gem 'sinatra'
gem 'sinatra-contrib'

# ActiveRecord
gem 'activerecord'
gem 'sinatra-activerecord'

# Rake
gem "rake"
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors',:require => 'rack/cors'

#Data Validation Library
gem "dry-validation"

#Reloading Rack Development
gem "shotgun"

#PostgreSQL Driver
gem 'pg'

#Geocoder for geocoding solutions
gem 'geocoder'

# Httparty
gem 'httparty'

gem 'faker', '~> 2.11.0'


group :test do
  gem 'rspec'
  gem 'factory_bot_rails'
  gem "database_cleaner"
  gem "shoulda"
  gem "shoulda-matchers", require: false
end
