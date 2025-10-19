source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# 基本
gem "rails", "~> 7.0.8", ">= 7.0.8.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# 認証
gem "devise"

# ★ 日本語化
gem "rails-i18n"
gem "devise-i18n"

# その他
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "pry"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "pry-rails"
  gem "pry-byebug"
end

group :development do
  gem "web-console"
  # gem "rack-mini-profiler"
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
gem "ruby-lsp", "~> 0.26.1", :group => :development
