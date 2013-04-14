require 'sinatra'
require 'sinatra/sequel'

# ---------------------------------- Configuration

set :database, 'sqlite://db/qcs_development.sqlite'
set :static, true
set :haml, format: :html5, views: 'app/views', layout: :'layouts/application'

# ---------------------------------- Models

models = File.join(File.dirname(__FILE__), 'app', 'models') # path to your models
$LOAD_PATH << File.expand_path(models)

# Constent Missing for requiring models files
def Object.const_missing(const)
  require const.to_s.downcase
  klass = const_get(const)
  return klass if klass
end

# ---------------------------------- Helper Methods

helpers do

  def current_subscribers
    Subscriber.where(subscribed: true)
  end

  def current_subscriber
    @subscriber ||= Subscriber.find_by_email(params[:email]) || halt(404)
  end

end

# ---------------------------------- Routes

get '/' do
  @message = 'Unsubscribed successfully.' if params[:success]
  haml :index
end

post '/' do
  begin
    @success = Subscriber.create(params[:subscriber])
  rescue Sequel::ValidationFailed => e
    @success = false
    @message = "Whoops! #{e.message.capitalize}."
  end
  haml :index
end

get '/unsubscribe' do
  haml :unsubscribe
end

post '/unsubscribe' do
  current_subscriber.subscribed = false
  current_subscriber.save
  redirect '/?success=1'
end

# ---------------------------------- Error handling

error 404 do
  '404 not found.'
end

