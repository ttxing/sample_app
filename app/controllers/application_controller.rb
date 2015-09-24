class ApplicationController < ActionController::Base
  before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def set_locale
    I18n.locale = params[:locale] || I18n.locale || I18n.default_locale
    # if params[:locale]      
      # I18n.default_locale = params[:locale]
    # end
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = I18n.t 'ApplicationController_PleaseLogIn'
      redirect_to login_url
    end
  end
end
