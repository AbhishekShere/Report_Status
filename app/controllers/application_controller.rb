class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def require_login
    unless user_signed_in?
      flash[:notice] = "You must be logged in to access Status."
      redirect_to new_user_session_path # halts request cycle
    end
  end
  
end

