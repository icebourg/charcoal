require 'rubygems'
require 'sinatra'
require 'haml'
require 'yaml'
require File.join(File.expand_path(File.dirname(__FILE__)), "slug.rb")

get '/' do
  @data = YAML.load_file "config.yml"
  puts @data
  haml :index, :locals => {:data => @data}
end

get '/all' do
  @data = YAML.load_file "config.yml"
  puts @data
  haml :stats, :locals => {:data => @data}
end
