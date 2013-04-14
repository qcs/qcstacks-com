# encoding: utf-8
require 'sinatra'
require 'haml'

class QCStacks < Sinatra::Application

  configure :development do
    set :static, true
    set :haml, format: :html5, views: 'app/views', layout: :'layouts/application'
  end

end

require_relative 'app/models/init'
require_relative 'app/helpers/init'
require_relative 'app/controllers/init'
