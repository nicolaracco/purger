module Purger
  module DataType
    def self.included klass
      klass.send :define_method, :initialize do |*args|
        if args.length > 0
          attrs = args[0]
          attrs.each { |k, v| send "#{k}=", v }
        end
      end
    end
  end
  
  class CpCode
    include DataType
    
    attr_accessor :id, :description, :service
  end
  
  module DataTypes
    class CPCode
      attr_accessor :id, :description, :service

      def initialize row
        self.id = row[:id]
        self.description = row[:description]
        self.service = row[:service]
      end
    end

    class PurgeRequestResult
      attr_accessor :id, :code, :message, :time, :failed_uri

      def initialize row
        self.id = row[:id]
        self.code = row[:code]
        self.message = row[:message]
        self.time = row[:time]
        self.failed_uri = row[:failed_uri]
      end
    end
  end
end
