require 'rubygems'
require 'sinatra'
require 'haml'
require 'yaml'
require File.join(File.expand_path(File.dirname(__FILE__)), "slug.rb")

get '/' do
  @data = YAML.load_file "config.yml"
  haml :index, :locals => {:data => @data}
end

get '/all' do
  @data = YAML.load_file "config.yml"
  haml :stats, :locals => {:data => @data}
end

get '/:server' do
  @config = YAML.load_file "config.yml"
  @data = {
    'Title' => @config['Title'],
    'RenderURL' => @config['RenderURL'],
    params[:server] => @config[params[:server]]
    }
  puts @data.to_yaml
  puts "Original config::::"
  puts @config.to_yaml
  haml :stats, :locals => {:data => @data }
end