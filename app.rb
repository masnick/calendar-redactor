require 'rubygems'
require 'bundler'
require 'digest/sha1'

Bundler.require :default, (ENV["RACK_ENV"] || "development").to_sym

configure :production do
  require 'rack-ssl-enforcer'
  use Rack::SslEnforcer
end

def get_urls
  if ENV["RACK_ENV"] == 'production'
    urls = ENV["CALENDAR_URLS"].split("|")
  else
    urls = IO.read("feeds.txt").split("\n")
  end

  # Check for HTTP (not secure) -- if you're going to the trouble to use this,
  # you should be using https
  raise "URL does not use HTTPS" if urls.select{|u| u =~ /http:/}.length > 0

  hshs = urls.map{|s| Digest::SHA1.hexdigest s}

  return [urls, hshs]
end

get '/' do
  if params["token"] != (ENV["SECURITY_TOKEN"] || "token_only_for_development_not_secure")
    sleep 10
    return "Access denied."
  end
  urls, hshs = get_urls
  erb :index, :locals => {
    urls: urls,
    hshs: hshs
  }
end

get '/:hsh' do |hsh|
  urls, hshs = get_urls

  unless hshs.include?(hsh)
    sleep 10
    return "Access denied."
  end

  response = HTTParty.get(urls[hshs.index(hsh)])
   if response.code == 200
      regexp = /(attendee|description|summary|location|organizer)([;:]).*\n([ ].*\n)*/i
     return response.body.gsub(regexp, '\1\2X'+"\n")
   else
     return "Error: #{response.code}"
  end
end