class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def admin_user
    unless current_user and current_user.admin?
      redirect_to root_url
    end
  end

  def logged_user
    redirect_to root_url, alert: "Please login, or use a Guest account." if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def get_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key       = TWITTER_CONFIG['consumer_key']
      config.consumer_secret    = TWITTER_CONFIG['consumer_secret']
      config.oauth_token        = TWITTER_CONFIG['oauth_token']
      config.oauth_token_secret = TWITTER_CONFIG['oauth_token_secret']
    end
  end
end
