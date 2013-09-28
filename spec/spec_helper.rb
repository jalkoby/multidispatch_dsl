require 'bundler/setup'
Bundler.require(:default)
Dir["#{ File.dirname(__FILE__) }/support/**/*.rb"].each { |f| require f }
