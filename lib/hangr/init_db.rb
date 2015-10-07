require 'active_record'
require 'yaml'

config_path = File.expand_path('../../../config/database.yml', __FILE__)
db_config = YAML::load(File.open(config_path))
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.establish_connection(db_config)
