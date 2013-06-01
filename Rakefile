desc "Build the website from source"
task :build do
  puts "## Building website"
  status = system("middleman build --clean")
  puts status ? "OK" : "FAILED"
end

desc "deploy basic rack app to Github pages"
multitask :push do
  puts "## Deploying to Github pages "
  cd "build" do
    system "git add ."
    system "git add -u"
    puts "\n## Committing: Site updated at #{Time.now.utc}"
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m '#{message}'"
    puts "\n## Pushing generated website"
    system "git push origin gh-pages"
    puts "\n## Github deploy complete"
  end
end

desc "Build and deploy website"
  task :deploy => [:build, :push] do
end
