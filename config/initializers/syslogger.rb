Syslogger.class_eval do
    def silence(temporary_level = Logger::ERROR)
      yield self
    end
end