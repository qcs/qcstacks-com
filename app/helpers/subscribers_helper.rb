# encoding: utf-8
module SubscribersHelper

  def current_subscribers
    Subscriber.where(subscribed: true)
  end

  def current_subscriber
    @subscriber ||= Subscriber.find_by_email(params[:email]) || halt(404)
  end

end

