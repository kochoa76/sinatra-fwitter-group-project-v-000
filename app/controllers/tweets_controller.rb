class TweetsController < ApplicationController


  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/index'
    else
      redirect to '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect to '/login'
    end
  end

  post '/tweets' do
    if logged_in?
      if params[:content] == ""
        redirect to "/tweets/new"
      else
        @tweet = current_user.tweets.create(content: params[:content])
        if @tweet.save
          redirect to "/tweets/#{@tweet.id}"
        else
          redirect to "/tweets/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/tweets/:id' do
    if logged_in?
     @tweet = Tweet.find_by_id(params[:id])
     erb :'tweets/show'
   else
     redirect to '/login'
   end
 end

 get '/tweet/:id/edit' do
   if logged_in?
     @tweet= Tweet.find_by_id(params[:id])
     erb :'/tweets/edit'
   else
     redirect '/login'
   end
 end 





end
