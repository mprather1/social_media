class UsersController < ApplicationController

#  layout 'default'

  before_action :confirm_logged_in, :except => [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Successfully created.\nPlease log in."
      redirect_to(:controller => 'home_pages', :action => 'home')
    else
      render(:new)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated"
      redirect_to(:action => 'index')

    else
      render(:edit)
    end

  end


  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "Sucessfully destroyed user"
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
