class UsersController < ApplicationController
  def index
    render template: 'users/index.html.erb', locals: { users: User.all }
  end

  def show
    if User.exists?(params[:id])
      render template: 'users/show.html.erb', locals: { user: User.find(params[:id]) }
    else
      render html: 'User not found', status: 404
    end
  end

  def new
    render locals: {
      user: User.new
    }
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.handle = params[:user][:handle]
    user.email = params[:user][:email]
    user.save
    redirect_to "/users/#{user.id}"
  end

  def edit
    render locals: {
      user: User.find(params[:id])
    }
  end

  def update
    user = User.find(params[:id])
    user.name = params[:user][:name]
    user.handle = params[:user][:handle]
    user.email = params[:user][:email]
    user.save
    redirect_to "/users/#{user.id}"
  end

  def destroy
    if User.exists?(params[:id])
      User.destroy(params[:id])
      flash[:notice] = "User deleted."
      redirect_to "users"
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end
end
