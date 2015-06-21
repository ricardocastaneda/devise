![Devise Logo](https://raw.github.com/plataformatec/devise/master/devise.png)

By [Plataformatec](http://plataformatec.com.br/).

To install, add to Gemfile:
gem 'devise', github: 'ricardocastaneda/devise'
gem 'devise-i18n'

It is necessary to install:
gem 'page_title_helper'

Branch that adds these features:

- Log with Username (and E-mail)
- Adds Spanish Devise locale, so you get 'en' and 'es'
- Translates all text inside views (en - es)
- Enables by default custom views scope
- All views are generated with haml instead of erb
- Each view will have a page title helper
- Generates app/views/layouts/devise.html.haml layout
- Generates a devise bar in app/views/layouts/_devise_bar.html.haml (you have to modify it)

Don't forget to open app/controllers/application_controller.rb and follow the instructions there
You have to uncomment the Message and insert it inside class ApplicationController < ActionController::Base




