class UserController < ApplicationController

    get '/users' do
        if logged_in?
            @users = User.all
            erb :'/users/index'
        else
            flash[:alert] = "You have to be logged in to view this page!"
            redirect "/login"
        end
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/users' do
        @user = User.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/scorecards"
        else
            erb :'users/signup'
        end
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        @scorecard = current_user.scorecards
        erb :'/users/show'
    end
end