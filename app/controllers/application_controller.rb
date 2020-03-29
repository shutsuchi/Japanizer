class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  # 認証前後のパス
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  # 全リンクにlocale情報をセット
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  # リンクの多言語化に対応
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[ name email age country_code ])

      devise_parameter_sanitizer.permit(:sign_in, keys: %i[ name ])
    end
end
