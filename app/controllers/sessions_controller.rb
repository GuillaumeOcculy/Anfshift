class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
  end
end
