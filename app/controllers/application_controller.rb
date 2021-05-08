class ApplicationController < ActionController::Base
  helper_method :current_user
  
  before_action :authorize!

  def current_user
    @current_user ||= User.find_by(id:  cookies.encrypted[:user_id])
  end

  def authorize!
    redirect_to sign_in_path unless current_user
  end
end
