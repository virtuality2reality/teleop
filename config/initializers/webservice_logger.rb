require 'webservice_logger'
logfile = File.open("#{Rails.root}/log/webservice.#{Rails.env}.log", 'a')
logfile.sync = true
WS_LOGGER = WebserviceLogger.new(logfile)