class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      sign_in user
      redirect_to user, flash: {success: "You are logged in !"}
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, flash: {warning: "You are logged out !"}
  end
end
