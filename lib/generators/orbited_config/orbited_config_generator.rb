require 'yaml'
require 'rails/generators'


class OrbitedConfigGenerator < Rails::Generators::Base
  
  argument :env, :type => :string, :optional => true, :default => 'development', :banner => 'enviroment'
  
  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end
  
  def create_orbited_config
     
    # Load config from config/orbited.yml
    @config = YAML.load_file(File.join(RAILS_ROOT, 'config', 'orbited.yml'))[env]
    @config.symbolize_keys!
    
    # Defaults
    puts env
    puts @config[:host]
    @config[:host] ||= 'localhost'
    @config[:port] ||= 8000
    @config[:ssl_host] ||= @config[:host]
    @config[:ssl_port] ||= @config[:port]
    @config[:stomp_host] ||= @config[:host]
    @config[:stomp_port] ||= 61613
    @config[:stomp_user] ||= ''
    @config[:stomp_password] ||= ''
    
    # Create the config file from template
    template 'orbited.cfg', 'config/orbited.cfg'
  end
  
end
