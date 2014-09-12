require 'grape'

module FacultyAPI
  autoload :API, File.expand_path('../faculty_api/api', __FILE__)
  autoload :URLForHelper, File.expand_path('../faculty_api/helpers/url_for_helper', __FILE__)
  autoload :FacultyEntity, File.expand_path('../faculty_api/entities/faculty_entity', __FILE__)
  autoload :FacultyIndexEntity, File.expand_path('../faculty_api/entities/faculty_index_entity', __FILE__)
  autoload :SchoolsAPI, File.expand_path('../faculty_api/schools_api', __FILE__)

  def self.initialize!
    require 'rails_config'
    RailsConfig.load_and_set_settings('./config/settings.yml', "./config/settings.#{env}.yml", './config/settings.local.yml')

    require 'mongoid'
    mongoid_yml_path = File.expand_path('../../config/mongoid.yml',  __FILE__)
    if File.exists? mongoid_yml_path
      Mongoid.load! mongoid_yml_path
    end
  end

  def self.env
    (ENV['RACK_ENV'] || ENV['RAILS_ENV'] || :development).to_sym
  end

  def self.base_url
    URI::Generic.build(Settings.url.to_h)
  end
end
