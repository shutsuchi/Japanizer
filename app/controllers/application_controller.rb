class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    top_path
  end

  def set_locale
    I18n.locale = locale
  end

  def locale
    @locale ||= params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def incorrect_user
    if current_user.present?
      user = User.find(params[:user_id])
      if user != current_user
        redirect_to top_path
      end
    else
      redirect_to top_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email age country_code])

    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name])
  end
end
