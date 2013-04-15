require 'feedzirra'
require 'aws/ses'
require 'haml'
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

    def self.subscribers
      @subscribers ||= Subscriber.all
    end

  end
end

class QCStacks::SES

  def initialize
    @entries = QCStacks::Parse.entries
    p body
  end

  def mail
    ses = AWS::SES::Base.new(
      access_key_id: '05E9M3Q690VXTHYXSX82',
      secret_access_key: 'hKdDtMMW/BH2e0erWQ1eHfMm0rhimvEdizX5bTUX'
    )
    ses.send_email(
      to: 'tcmacdonald@gmail.com',
      from: 'tcmacdonald@gmail.com',
      subject: 'QCS Test',
      html_body: body
    )
  end

  def body
    root = File.dirname(__FILE__)
    layout = File.read("#{root}/../app/views/layouts/email.haml")
    tpl = File.read("#{root}/../app/views/email.haml")
    body = Haml::Engine.new(tpl).render(Object.new, entries: @entries)
    Haml::Engine.nw(layout).render(Object.new, yield: body)
  end

end
