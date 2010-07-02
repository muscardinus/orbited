class OrbitedGenerator < Rails::Generators::Base
  
  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end
  
  def create_orbited_yml_config
    copy_file 'orbited.yml', 'config/orbited.yml'
  end
end
