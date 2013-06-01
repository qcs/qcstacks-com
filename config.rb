###---------------------------------------------------- Gem Requirements Settings

require 'compass'
require 'susy'

###---------------------------------------------------- Blog Settings

activate :blog do |blog|
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year/:month/:day/:title.html"
  blog.layout = "article"
  blog.summary_separator = /(READMORE)/
  blog.default_extension = ".erb"
  blog.paginate = false
  blog.calendar_template = "calendar.html"
end

###---------------------------------------------------- Layout Settings

page "/", layout: "public"
page "/archive/*", layout: "public"
page "/about", layout: "public"
page "/email/*", layout: false
page "/feed.xml", layout: false

ready do
  archive_resources = []
  recent_articles.group_by {|a| a.date.strftime('%B %Y') }.each do |month, month_articles, month_name|
    archive_resources << {month: month, articles: month_articles } 
  end
  page "/archive/index.html", :layout => :public do
    @archives = archive_resources
  end
end

###---------------------------------------------------- Helper Methods

helpers do

  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end

  def recent_articles
    @recent_articles ||= blog.articles.collect{ |a| a if a.date <= Date.today }.compact
  end

  def recent_articles_grouped
    @recent_articles_grouped ||= recent_articles.group_by{|a| a.date }
  end

  def todays_date
    @todays_date ||= Date.today.strftime("%A, %B %e %Y")
  end

end


###---------------------------------------------------- Build Settings

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :relative_assets
end

###---------------------------------------------------- Deploy Settings

activate :deploy do |deploy|
  deploy.method = :git
  deploy.user = "procload"
end

