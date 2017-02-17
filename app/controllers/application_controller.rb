class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def auth_required
    unless current_user
      session[:target_url] = request.fullpath
      redirect_to new_session_path, :flash => { :error => "This site is protected. Please log in first." }
    end
  end

  def access_only_with_roles(*roles)
    if current_user
      unless roles.include? current_user.role
        session[:target_url] = request.fullpath
        redirect_to new_session_path, :flash => { :warning => "Access denied. Insufficent rights." }
      end
    end
  end

end
