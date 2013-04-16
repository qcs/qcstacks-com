require 'feedzirra'
require 'aws/ses'
require 'erb'
require 'tilt'
require_relative '../app/models/init'

module QCStacks
  module Parse

    def self.feed
      @feed ||= Feedzirra::Feed.fetch_and_parse("http://localhost:9393/feed.xml")
    end

    def self.entries
      @entries ||= begin
        today = Time.now
        entries = feed.entries.collect{ |e|
          e if today.strftime('%m/%d/%Y') == e.published.to_datetime.strftime('%m/%d/%Y')
        }.compact
      end
    end

  end
end

class QCStacks::SES

  def initialize
    @subscribers = Subscriber.where(subscribed: true).all
    @today = Time.now.strftime('%A, %B %d, %Y')
  end

  def mail
    @subscribers.each do |subscriber|
      deliver(subscriber.email)
    end
  end

  def deliver(recipient)
    ses = AWS::SES::Base.new(
      access_key_id: '05E9M3Q690VXTHYXSX82',
      secret_access_key: 'hKdDtMMW/BH2e0erWQ1eHfMm0rhimvEdizX5bTUX'
    )
    ses.send_email(
      to: recipient,
      from: 'tcmacdonald@gmail.com',
      subject: "QCStacks for #{@today}",
      html_body: body
    )
  end

  def body
    @entries = QCStacks::Parse.entries
    root = File.dirname(__FILE__)
    template = Tilt::ERBTemplate.new("#{root}/../app/views/email.erb")
    template.render(Object.new, entries: @entries)
  end

end
