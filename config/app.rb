require 'yaml'

#auth config
config_dir = File.dirname __FILE__

auth_file = File.join config_dir, 'auth.yml'
if File.exist? auth_file
  authd = YAML.load_file(auth_file)['akamai_api']
  AkamaiApi.account = AkamaiApi::LoginInfo.new authd['username'], authd['password']
end

#mustache config
Mustache.template_path = File.join config_dir, '..', 'templates'
