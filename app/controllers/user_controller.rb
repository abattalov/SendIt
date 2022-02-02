class UserController < ApplicationController

    get '/users' do
        @user = User.all
        erb :'/users/index'
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
        erb :'/users/show'
    end
end