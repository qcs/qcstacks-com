require_relative 'lib/qcstacks'

namespace :qcs do

  desc 'Parse QCS Feed.'
  task :parse do
    #p QCStacks::Parse.subscribers
    ses = QCStacks::SES.new
    ses.mail
  end

end

