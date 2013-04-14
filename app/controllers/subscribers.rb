# encoding: utf-8
class QCStacks < Sinatra::Application

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

  error 404 do
    '404 not found.'
  end

end
