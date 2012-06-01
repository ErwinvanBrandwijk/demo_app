class UsersController < ApplicationController

  def index
    @title = "Users"
    @users = User.all  
  end
  
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
end
