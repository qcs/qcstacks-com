# encoding: utf-8
require 'sinatra'
require 'haml'

class QCStacks < Sinatra::Application

  set :static, true
  set :haml, format: :html5, views: 'app/views', layout: :'layouts/application'

  configure :development do
    require 'better_errors'
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path("..", __FILE__)
  end

end

require_relative 'app/models/init'
require_relative 'app/helpers/init'
require_relative 'app/controllers/init'
