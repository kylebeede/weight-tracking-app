class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def show
    if logged_in?
      @user = User.find(current_user[:id])
    else
      @user = User.find(params[:id]) 
    end
    @weight_entry = current_user.weight_entries.build if logged_in?
    @weight_entries = current_user.weight_entries
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render '/static_pages/home'
    end
  end

  def edit
    @user = User.find(current_user[:id])
  end

  def update
    @user = User.find(current_user[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to '/home'
    else
      render 'edit'
    end
  end

  def destroy
    email = current_user[:email]
    User.find(current_user[:id]).destroy
    flash[:success] = "The account for %s has been deleted" % [email]
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters
    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
