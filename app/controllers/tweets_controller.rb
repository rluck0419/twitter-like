class TweetsController < ApplicationController
  def index
    render template: 'tweets/index.html.erb', locals: { tweets: Tweet.all }
  end

  def show
    if Tweet.exists?(params[:id])
      render template: 'tweets/show.html.erb', locals: { tweet: Tweet.find(params[:id]), users: User.all }
    else
      render html: 'Tweet not found', status: 404
    end
  end

  def new
    render locals: {
      tweet: Tweet.new
    }
  end

  def create
    tweet = Tweet.new
    tweet.body = params[:tweet][:body]
    tweet.user_id = params[:tweet][:user_id]
    tweet.save
    redirect_to "/tweets/#{tweet.id}"
  end

  def destroy
    if Tweet.exists?(params[:id])
      Tweet.destroy(params[:id])
      flash[:notice] = "Tweet destroyed."
      redirect_to "/tweets"
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end
end
