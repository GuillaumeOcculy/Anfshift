class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:new, :create]
  # before_action :correct_user, except: [:new, :create, :index]
  # before_action :current_admin, only: :index

  def index
    @users  = User.all
  end

  def show
    @shifts = @user.shifts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user, flash: {success: 'Account has been created !'}
    else
      flash[:danger] = 'Account has not been updated !'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, flash: {success: 'Account has been updated !'}
    else
      flash[:danger] = 'Account has not been updated !'
      render :edit
    end
  end

  def destroy
    @user.destroy
    reset_session
    redirect_to root_path, flash: {warning: 'Account has been deleted !'}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :job)
  end

  def find_user
    @user = User.friendly.find(params[:id])
  end

  def correct_user
    unless current_user && @user.id == current_user.id || current_user && current_user.is_admin
      flash[:danger] = 'You are not a correct user !'
      redirect_to root_path
    end
  end
end
