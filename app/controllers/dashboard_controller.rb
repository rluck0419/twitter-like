class DashboardController < ApplicationController
  def index
    render template: 'dashboard/index.html.erb', locals: { tweets: Tweet.all }
  end
end
