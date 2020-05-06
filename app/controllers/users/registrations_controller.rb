# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # GET /resource/sign_up
  def new
    build_resource
    resource.build_profile
    yield resource if block_given?
    respond_with resource
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                        :attribute,
                                        profile_attributes: %i[name gender birthdate email phone time_zone]
                                      ])
  end
end
