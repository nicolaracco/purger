module Purger
  module View
    def self.included klass
      klass.send :include, Purger::DataType
      klass.extend ClassMethods
    end

    module ClassMethods
      def console *args
        obj = self.new *args
        puts obj.render
      end
    end
  end
  
  class CpCodesView < Mustache
    include View
    
    attr_accessor :cp_codes
  end

  class PurgeView < Mustache
    include View

    attr_accessor :code, :message, :failed_uri, :request_id, :time

    def success?
      code < 200 && code >= 100
    end
  end
end
