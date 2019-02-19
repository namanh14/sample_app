class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "Welcome_App!"
      redirect_to @user
    else
      flash[:fails] = t "error"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    
    return if @user
    flash[:danger] = t "error_find_user"
    redirect_to signup_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
