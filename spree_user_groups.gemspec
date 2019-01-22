Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_user_groups'
  s.version     = '3.0.1'
  s.summary     = 'Adds user groups'
  s.description = 'Provides opportunity to add some rules for calculation price depending on the user group'
  s.required_ruby_version = '>= 2.2.7'

  s.author   = 'Roman Smirnov'
  s.email    = 'POMAHC@gmail.com'
  s.homepage = 'https://github.com/romul/spree_user_groups'
  s.license  = 'MIT'

  # s.files = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

   spree_version = '>= 3.1.0', '< 4.0'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'simplecov'

  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'shoulda-matchers'
end
