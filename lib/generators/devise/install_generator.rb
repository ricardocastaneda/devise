require 'rails/generators/base'
require 'securerandom'

module Devise
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Devise initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        template "devise.rb", "config/initializers/devise.rb"
      end

      def copy_locale
        #copy_file "../../../app/controllers/applicat"
        copy_file "../../../config/locales/en.yml", "config/locales/devise.en.yml"
        copy_file "../../../config/locales/es.yml", "config/locales/devise.es.yml"

        devise_route << %Q(, class_name: "#{class_name}") if class_name.include?("::")
        File.write('/app/controllers/application_controller.rb', 'Some glorious content')
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

      def rails_4?
        Rails::VERSION::MAJOR == 4
      end
    end
  end
end
