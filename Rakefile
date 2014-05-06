desc "create text file for new story"
task :create, [:filename] do |t, args|
  filename = args.filename.downcase.gsub(/[^a-z0-9]/,'-')
  today = Time.now
  month = today.month < 10 ? "0#{today.month}" : "#{today.month}"
  day = today.day < 10 ? "0#{today.day}" : "#{today.day}"
  dst = "source/#{today.year}/#{month}/#{day}/"
  FileUtils.mkdir_p(dst)
  File.open("#{dst}#{filename}.html.erb", 'w') {|f|
    f.write("---\r\ntitle: \r\nurl: \r\n---\r\n")
  }
  p "#{dst}/#{filename} created"
end
