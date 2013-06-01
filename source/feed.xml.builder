xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Queen City Stacks"
  xml.subtitle "Relevant news and content for all things Cincinnati."
  xml.id "http://queencitystacks.com/"
  xml.link "href" => "http://qcstacks.com/"
  xml.link "href" => "http://qcstacks.com/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Queen City Stacks" }
  blog.articles.each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.data.try(:[], :url)
      xml.id article.data.try(:[], :url)
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Queen City Stacks" }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
