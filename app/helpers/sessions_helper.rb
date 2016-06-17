module SessionsHelper
    
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
 
  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  def admin_user?
    logged_in? && current_user.admin?
  end
  
  def store_location
    session[:return_to] = request.url if request.get?
  end
  
  def log_in_user
    unless logged_in?
      store_location
      redirect_to login_url, notice: t('please_sign_in')
    end
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  def redirect_back_or(default)
    if logged_in?
      redirect_to(session[:return_to] || users_path)
    else
      redirect_to(root_url)
    end
    session.delete(:return_to)
  end
end
