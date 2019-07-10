# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ************************Add Devise to my app *************************

* Add this line in the Gemfile
	add gem 'devise'

* Installing all the gem files listed in the Gemfile
	bundle install --without production

* Installing devise package into the computer
	rails generate devise:install

* Using devise to generate user migration files and user model along with views
	rails generate devise User  

* Create a User table in the database
	rake db:migrate

* pull up application_controller add this line in the class
	before_action :authenticate_user!

* go to the welcome index page and add a link to log out
	<%= link_to "log out", destroy_user_session_path, method: :delete %>
	rake routes -- command show all the routes information

* Add below two lines to Gemfile
	gem 'twitter-bootstrap-rails'
	gem 'jquery-rails'

* install the above new gem with below command:
	bundle install --without production

* Installing bootstrap 
	rails generate bootstrap:install static

* rails g bootstrap:layout application
	override using Y
	enter capital Y 

* add another gem to Gemfile
	gem 'devise-bootstrap-views'

* bundle install --without production

* go to asset/stylesheets/aplication.css
	above *= require_tree .
	add this line
	*= require devise_bootstrap_views (But for my case, I need to remove this line)
* go to asset/stylesheets/aplication.js
	below //= require rails-ujs
	add this line 
	//= require jquery
	//= require twitter/bootstrap

* rails g devise:views:locale en

* rails g devise:views:bootstrap_templates

* pull up the config/routes.rb file and add devise users to this file
	devise_for :users

* start my server
	rails s
