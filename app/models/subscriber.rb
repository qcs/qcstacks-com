# encoding: utf-8
Sequel::Model.plugin :validation_helpers

class Subscriber < Sequel::Model

  def validate
    validates_presence(:name)
    validates_presence(:email)
    validates_unique(:email) unless email.empty?
    validates_format(/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :email) unless email.empty?
  end

  def self.find_by_email(email)
    first(email: email)
  end

  def self.resubscribe?(email)
    subscriber = Subscriber.find(email: email, subscribed: false)
    subscriber.update(subscribed: true) if subscriber
  end

end
