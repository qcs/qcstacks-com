# encoding: utf-8
require_relative '../helpers/subscribers_helper'

class QCStacks < Sinatra::Application

  get '/' do
    @message = 'Unsubscribed successfully.' if params[:success]
    haml :index
  end

  post '/' do
    begin
      @success = Subscriber.create(params[:subscriber])
      @message = "Thanks for signing up!"
    rescue Sequel::ValidationFailed => e
      if e.message.eql?('email is already taken') && Subscriber.resubscribe?(params[:subscriber][:email])
        @success = true
        @message = "Subscription updated successfully."
      else
        @success = false
        @message = "Whoops! #{e.message.capitalize}."
      end
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

  not_found do
    '404 not found.'
  end

end
