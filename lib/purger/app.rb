require 'thor'

module Purger
  class App < ::Thor
    desc "cp_codes", "Return the list of CP Codes"
    method_option :username, :type => :string, :aliases => '-u'
    method_option :password, :type => :string, :aliases => '-p'
    def cp_codes
      cp_codes = Purger::SiteAcceleratorAdapter.cp_codes get_auth_if_exist
      Purger::CpCodesView.console :cp_codes => cp_codes
    end

    desc "purge_uri", "Purge the requested URI(s)"
    method_option :username, :type => :string , :aliases  => '-u'
    method_option :password, :type => :string , :aliases  => '-p'
    method_option :deep    , :type => :boolean, :aliases  => '-D'
    method_option :notify  , :type => :string , :required => true
    method_option :uris    , :type => :array  , :required => true
    def purge_uri
      opts = {
        :type => 'arl',
        :deep => options[:deep],
        :notify => options[:notify]
      }
      resp = Purger::CcuAdapter.purge options[:uris], opts, get_auth_if_exist
      Purger::PurgeView.console resp
    end

    desc "purge_cpcode", "Purge the requested CPCode(s)"
    method_option :username, :type => :string , :aliases  => '-u'
    method_option :password, :type => :string , :aliases  => '-p'
    method_option :deep    , :type => :boolean, :aliases  => '-D'
    method_option :notify  , :type => :string , :required => true
    method_option :codes   , :type => :array  , :required => true
    def purge_cpcode
      opts = {
        :type => 'cpcode',
        :deep => options[:deep],
        :notify => options[:notify]
      }

      resp = Purger::CcuAdapter.purge options[:codes], opts, get_auth_if_exist
      Purger::PurgeView.console resp
    end
    
    private
    def get_auth_if_exist
      options[:username] && AkamaiApi::LoginInfo.new(options[:username], options[:password]) or nil
    end
  end
end
