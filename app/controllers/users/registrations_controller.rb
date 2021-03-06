# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # new_user_registration_path
  # def new
  #   super
  # end

  # POST /resource
  # user_registration_path
  def create
    super
    # Empty Recorde Create (album, event)
    return unless @user.save

    event = @user.events.new(user_id: @user.id, genre_id: 1)
    if event.save
      album = @user.albums.new(user_id: @user.id, genre_id: 1, title: '', post_quantity: 0)
      album.save
    end
    flash[:notice] = t('users.flash.s_notice')
  end

  # GET /resource/edit
  # edit_user_registration_path
  # def edit
  #   super
  # end

  # PUT /resource
  # user_registration_path
  # def update
  #   super
  # end

  # DELETE /resource
  # user_registration_path
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
