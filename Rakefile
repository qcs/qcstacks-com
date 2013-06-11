desc "Build the website from source"
task :build do
  puts "## Building website"
  status = system("bundle exec middleman build --clean")
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
    system "git push -f origin gh-pages"
    puts "\n## Github deploy complete"
  end
end

desc "Build and deploy website"
task :deploy => [:build, :push] do
end

desc "create text file for new story"
task :create, [:filename] do |t, args|
  filename = args.filename.downcase.gsub(/[^a-z0-9]/,'-')
  today = Time.now
  month = today.month < 10 ? "0#{today.month}" : "#{today.month}"
  day = today.day < 10 ? "0#{today.day}" : "#{today.day}"
  dst = "source/#{today.year}/#{month}/#{day}/"
  FileUtils.mkdir_p(dst)
  File.open("#{dst}#{filename}.html.erb", 'w') {|f|
    f.write("---\r\ntitle:#{args.filename}\r\nurl:\r\n---\r\n")
  }
  p "#{dst}/#{filename} created"
end
