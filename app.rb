#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/base'
require 'rack-rewrite'

require 'haml'

require './lib/sass_handler.rb'
require './lib/coffee_handler.rb'


class MidwivesOfDiscord < Sinatra::Base
  
  use SassHandler
  use CoffeeHandler
  use Rack::Logger
  
  use Rack::Rewrite do
    r301 %r{.*},  Proc.new { |path, rack_env| "http://www.#{rack_env['SERVER_NAME']}#{path}" },
      :if => Proc.new { |rack_env| (rack_env['SERVER_NAME'] =~ /^midwivesofdiscord\.(dev|com)+/i)
    }
  end
  
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :views, File.dirname(__FILE__) + '/views'
  set :logging, true
  
  get '/' do
    haml :root
  end

end