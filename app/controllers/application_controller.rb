class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Methods

  # Assign user session
  def sign_in(user)
    session[:user_id] = user.id
  end

  # User who is signed
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Check if user is signed in
  def user_signed_in?
    !current_user.nil?
  end

  # Redirect to signin_path if current_user is nil
  def signed_in_user
    unless user_signed_in?
      flash[:danger]= 'You need to be signed in !'
      redirect_to signin_path
    end
  end

  def current_admin
    true if current_user && current_user.is_admin
  end

end
