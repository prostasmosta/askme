source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'font-awesome-rails'
gem 'gravtastic'
gem 'jbuilder'
gem 'importmap-rails'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'recaptcha'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# gem 'sassc-rails'
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'

  # gem 'rack-mini-profiler'
  # gem 'spring'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
