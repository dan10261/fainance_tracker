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
 
* ****************** Add iex client ********************* 
* add a new gem called iex-ruby-client to your Gemfile
	gem 'iex-ruby-client'
	and then run
	bundle install
* create a free account https://iexcloud.io/

**********************Add gem stock_quote************************************

* gem 'stock_quote'

* bundle install --without production

* enter commands: 
	rails console
	StockQuote::Stock.new(api_key: 'SECRET KEY PASTE HERE') 
	StockQuote::Stock.quote('GOOG')  

* ---GOOG : Ticker symble for google

*  ----- you can validate your stock secret key with :
	https://cloud.iexapis.com/beta/account/usage/messages?token='SECRET KEY PASTE HERE'
	
**********************Add Model association************************************

* Use below command to generate migration and model files altogether
	 rails generate model UserStock user:references stock:references
	 
* Go to user model file
	has_many :user_stocks 
	has_many :stocks , through: :user_stocks

* Go to stock model file
	has_many :user_stocks
	has_many :users, through: user_stocks

* Generate a UserStocks controller
	rails generate controller UserStocks
