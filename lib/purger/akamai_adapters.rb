module Purger
  module SiteAcceleratorAdapter
    def self.cp_codes auth=nil
      client = AkamaiApi::SiteAccelerator.new auth
      client.cp_codes.each do |obj|
        Purger::CpCode.new :id => obj[:code], :service => obj[:service], :description => obj[:description]
      end
    end
  end

  module CcuAdapter
    def self.purge uris, options, auth=nil
      opts = {
        :type => options[:type],
        :action => (options[:deep] && 'purge' or 'invalidate'),
        :'email-notification' => options[:notify]
      }
      client = AkamaiApi::Ccu.new auth
      resp = client.purge uris, opts
      {
        :code => resp[:code],
        :message => resp[:message],
        :failed_uri => resp[:failed_uri],
        :request_id => resp[:id],
        :time => resp[:time] / 60
      }
    end
  end
end
