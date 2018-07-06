require './app/controllers/base_controller'
require 'bcrypt'

# Auth controller class.
class AuthController < BaseController
  login_user_page = lambda do
    haml :index
  end

  register_user_page = lambda do
    haml :register
  end

  login_user = lambda do
    @user = User.new
    result = @user.confirm_password(params['password'], params['email'])
    if result then redirect '/' else halt 401, 'wrong login credentials' end
  end

  register_user = lambda do
    email = params['email']
    username = params['username']
    halt 409, 'Email already exists' if User.find_by(email: email)
    halt 409, 'Username already taken' if User.find_by(username: username)
    @user = User.new
    @user.create(email, username, params['password'])
    redirect '/login'
  end

  logout_user = lambda do
    session[:user_id] = nil
    redirect '/'
  end

  get '/login', &login_user_page
  get '/register', &register_user_page
  post '/login', &login_user
  post '/register', &register_user
  get '/logout', &logout_user
end
