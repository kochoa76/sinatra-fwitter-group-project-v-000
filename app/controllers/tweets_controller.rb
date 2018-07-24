class TweetsController < ApplicationController


  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/index'
    else
      redirect to '/login'
    end
  end

  get 'users/new' do
    if logged_in?
    erb :'tweets/new'
  else
    redirect to '/login'
  end

  end


end
