class SessionController < ApplicationController
    
    get '/login' do
        erb :'session/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/scorecards'
        else
            flash[:notice] = "You have entered an invalid username or password. Please try again."
            redirect "/login"
        end
    end

    get '/logout' do
        session.clear
        redirect "/login"
    end
end