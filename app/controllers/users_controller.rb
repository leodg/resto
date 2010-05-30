class UsersController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Спасибо за регистрацию!'
      redirect_to root_url
    else
      render :action => "new"
    end
  end


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = current_user
  end


  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Профиль изменен'
      redirect_to(@user)
    else
      render :action => "edit"
    end
  end

end
