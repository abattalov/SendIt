require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SECRET_KEY']
    register Sinatra::Flash
  end

  get "/" do
    @users = User.all
    erb :welcome
  end

  get "/about" do
    erb :"/about/about"
  end

  helpers do

    def logged_in?
      session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def all_users
      @users = User.all
    end
  end

end
