require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'haml'

require './config/environments'

# Base controller for all other controllers.
class BaseController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, '@31412drsvsgt!sdasdnjf34vb'
  end

  # Homepage
  get '/' do
    haml :index
  end
end
