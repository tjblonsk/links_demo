require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/manual_links' do
  @links = ['http://reddit.com', 'http://techcrunch.com', 'http://gizmodo.com']

  erb :links
end

get '/links' do
  link_file = File.new('links.csv', 'r')
  @links = []
  link_file.each do |line|
    parsed_link = line.split(',')
    @links << parsed_link
end
link_file.close

erb :links
end

