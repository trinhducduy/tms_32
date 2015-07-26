module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def log_out
    forget current_user
    session.delete :user_id
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find user_id
      if user && user.authenticated?(cookies[:remember_token])
        @current_user = user
      end
    end
  end

  def current_user? user
    current_user == user
  end

  def authenticate_user!
    unless logged_in?
      flash[:danger] = t "application.flash.required_login"
      redirect_to login_path
    end
  end
end
