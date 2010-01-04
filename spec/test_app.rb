#
# Sinatra app
#
# It is put in a separate file to make sure we are getting a realistic test
#
require 'sinatra/base'
require 'sinatra/controller'

class Application < Sinatra::Controller
  set :app_file, __FILE__
end
Application.run!
