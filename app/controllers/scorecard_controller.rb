class ScorecardController < ApplicationController

    get '/scorecards' do
        @scorecard = Scorecard.all
        erb :'/scorecards/index'
    end

    get '/scorecards/new' do
        @scorecard = Scorecard.new(params)
        erb :'/scorecards/new'
    end

    get '/scorecards/:id' do
        @scorecard = Scorecard.find_by_id(params[:id])
        erb :'/scorecards/show'
    end

    post '/scorecards' do
        scorecard = Scorecard.new(params)
        if scorecard.save
            redirect "/scorecards/#{scorecard.id}"
        else
            redirect "/scorecards/new"
        end
    end

    get '/scorecards/:id/edit' do
        @scorecard = Scorecard.find_by_id(params[:id])
        erb :'/scorecards/edit'
    end

    patch '/scorecards/:id' do
        @scorecard = Scorecard.find_by_id(params[:id])
        params.delete("_method")
        @scorecard.update(params)
        
        redirect "/scorecards/#{@scorecard.id}"
    end

    delete "/scorecards/:id" do
        @scorecard = Scorecard.find_by_id(params[:id])
        @scorecard.destroy
        redirect "/scorecards"
    end

end