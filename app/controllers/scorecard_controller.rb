class ScorecardController < ApplicationController

    get '/scorecards' do
        if logged_in?
            @scorecard = Scorecard.all
            erb :'/scorecards/index'
        else
            flash[:alert] = "You have to be logged in to view this page!"
            redirect '/login'
        end
    end

    get '/scorecards/new' do
        if logged_in?
            @scorecard = Scorecard.new(params)
            erb :'/scorecards/new'
        else
            flash[:alert] = "You have to be logged in to view this page!"
            redirect '/login'
        end
    end

    get '/scorecards/:id' do
        @users = User.all
        if logged_in?
            @scorecard = Scorecard.find_by_id(params[:id])
            erb :'/scorecards/show'
        else
            flash[:alert] = "You have to be logged in to view this page!"
            redirect '/login'
        end
    end

    post '/scorecards' do
        scorecard = current_user.scorecards.new(params)
        if scorecard.save
            redirect "/scorecards/#{scorecard.id}"
        else
            redirect "/scorecards/new"
        end
    end

    get '/scorecards/:id/edit' do
        if logged_in?
            @scorecard = Scorecard.find_by_id(params[:id])
            if @scorecard.user_id != current_user.id || @scorecard.user_id == nil
                redirect '/scorecards'
            else
                erb :'/scorecards/edit'
            end
        else
            flash[:alert] = "You have to be logged in to view this page!"
            redirect '/login'
        end
    end

    patch '/scorecards/:id' do
        @scorecard = Scorecard.find_by_id(params[:id])
        params.delete("_method")
        @scorecard.update(params)
        
        if @scorecard.update(params)
            redirect "/scorecards/#{@scorecard.id}"
        else
            redirect "/scorecards/new"
        end
    end

    delete "/scorecards/:id" do
        @scorecard = Scorecard.find_by_id(params[:id])
        if @scorecard.user_id == current_user.id
            @scorecard.destroy
            redirect "/scorecards"
        else
            redirect "/scorecards"
        end
    end

end