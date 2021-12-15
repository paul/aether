# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

gem "bundler", "~> 2.2.32"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0.rc1"

# 7.0 asset pipeline
gem "sprockets-rails", ">= 3.4.1"
gem "jsbundling-rails", "~> 0.2.2"
gem "cssbundling-rails", "~> 0.2.7"
gem "haml", "~> 5.2"

# Database
gem "pg", "~> 1.1"

# Webserver
gem "puma", "~> 5.0"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Use Sass to process CSS
# gem "sassc-rails", "~> 2.1"

# Performance
gem "fast_blank", "~> 1.0"
gem "oj", "~> 3.11"

# Developer happiness
gem "amazing_print", "~> 1.2"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false
gem "progress_bar", "~> 1.3"

# Performance Tuning
gem "benchmark-ips", "~> 2.7", require: false

group :development, :test do
  # See https://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", ">= 1.0.0", platforms: %i[mri mingw x64_mingw]

  gem "rspec", "~> 3.9"
  gem "rspec_junit_formatter", "~> 0.4"
  gem "rspec-rails", "~> 5.0"
  gem "rspec-resembles_json_matchers", "~> 0.9"
  
  # linters
  gem "bundle-audit",         "~> 0.1", require: false
  gem "database_consistency", "~> 1.1", require: false
  gem "reek",                 "~> 6.0", require: false
  gem "rubocop",              "~> 1.9", require: false
  gem "rubocop-performance",  "~> 1.8", require: false
  gem "rubocop-rails",        "~> 2.8", require: false
  gem "rubocop-rspec",        "~> 2.0", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", ">= 4.1.0"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler", ">= 2.3.3"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem "annotate", "~> 3.1"

  gem "guard",       "~> 2.16"
  gem "guard-rspec", "~> 4.7"

  # Performance Tuning
  gem "rbtrace",       "~> 0.4", require: false
  gem "ruby-prof",     "~> 1.0", require: false
  gem "stackprof",     "~> 0.2", require: false
end


