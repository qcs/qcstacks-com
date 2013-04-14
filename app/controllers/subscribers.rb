# encoding: utf-8
require_relative '../helpers/subscribers_helper'

class QCStacks < Sinatra::Application

  get '/' do
    haml :index
  end

  post '/' do
    begin
      flash[:notice] = "Thanks for signing up!" if Subscriber.create(params[:subscriber])
    rescue Sequel::ValidationFailed => e
      if e.message.eql?('email is already taken') && Subscriber.resubscribe?(params[:subscriber][:email])
        flash[:notice] = "Subscription updated successfully."
      else
        flash[:error] = "Whoops! #{e.message.capitalize}."
      end
    end
    redirect '/'
  end

  get '/unsubscribe' do
    haml :unsubscribe
  end

  post '/unsubscribe' do
    current_subscriber.subscribed = false
    current_subscriber.save
    flash[:notice] = "Unsubscribed successfully."
    redirect '/'
  end

  not_found do
    '404 not found.'
  end

end
