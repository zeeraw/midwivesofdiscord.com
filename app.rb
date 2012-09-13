#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/base'

require 'haml'

require './lib/sass_handler.rb'
require './lib/coffee_handler.rb'


class MidwivesOfDiscord < Sinatra::Base
  
  use SassHandler
  use CoffeeHandler
  use Rack::Logger
  
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :views, File.dirname(__FILE__) + '/views'
  set :logging, true
  
  get '/' do
    haml :root
  end

end