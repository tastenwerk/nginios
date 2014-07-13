module Caminio
  class Engine < ::Rails::Engine

    isolate_namespace Caminio

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[File.join( File.expand_path('../../../',__FILE__), 'app', 'api', '*')]

    # rspec
    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    # initializer "assets_initializers.initialize_rails", :group => :assets do |app|
    #   require "#{Rails.root}/config/initializers/load_config.rb"
    # end

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w( caminio.js caminio.css )
    end
    #   Rails.application.config.assets.precompile << %w(
    #     caminio/index.js
    #     caminio/index.css
    #   )
    # end

    if defined?( ActiveRecord )
      ActiveRecord::Base.send( :include, Caminio::Schemas::WebObject )
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

  end
end