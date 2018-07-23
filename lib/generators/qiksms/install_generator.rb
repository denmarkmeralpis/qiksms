require 'rails/generators'

# name
module Qiksms
  # Generator
  module Generators
    # Class generatpr
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)
      desc 'Creates qiksms.rb initializer for your application'

      def copy_initializer
        template 'qiksms_initializer.rb', 'config/initializers/qiksms.rb'
        puts 'Done install! Configure the file in config/initializers/qiksms.rb'
      end
    end
  end
end
