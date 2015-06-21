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
        copy_file "../../../config/locales/en.yml", "config/locales/devise.en.yml"
        copy_file "../../../config/locales/es.yml", "config/locales/devise.es.yml"

        copy_file "../../../config/locales/devise.views.en.yml", "config/locales/devise.views.en.yml"
        copy_file "../../../config/locales/devise.views.es.yml", "config/locales/devise.views.es.yml"

        copy_file "../../../app/views/layouts/devise.html.haml", "app/views/layouts/devise.html.haml"
        copy_file "../../../app/views/layouts/_devise_bar.html.haml", "app/views/layouts/_devise_bar.html.haml"
      end

      File.open('app/controllers/application_controller.rb', 'a') { |f|
        f << "# Insert this code inside class ApplicationController < ActionController::Base\n"
        f << "# Necessary to make Devise Work with username\n"
        f << "# before_action :configure_permitted_parameters, if: :devise_controller?\n"
        f << "# protected\n"
        f << "# def configure_permitted_parameters\n"
        f << "#   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) } \n"
        f << "#   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }\n"
        f << "#   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }\n"
        f << "# end\n"
      }

      def show_readme
        readme "README" if behavior == :invoke
      end

      def rails_4?
        Rails::VERSION::MAJOR == 4
      end
    end
  end
end
