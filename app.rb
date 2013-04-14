# encoding: utf-8
require 'sinatra'
require 'rack-flash'
require 'haml'

class QCStacks < Sinatra::Application

  enable :sessions

  set :static, true
  set :haml, format: :html5, views: 'app/views', layout: :'layouts/application'

  use Rack::Flash, :sweep => true
  use Rack::Session::Cookie, secret: 'its the end of the world as we know it...'

  configure :development do
    require 'better_errors'
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path("..", __FILE__)

  end

end

require_relative 'app/models/init'
require_relative 'app/helpers/init'
require_relative 'app/controllers/init'
