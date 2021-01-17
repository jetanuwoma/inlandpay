# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  PERMISSABLE_ATTRIBUTES = %i[first_name last_name phone_number].freeze

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSABLE_ATTRIBUTES)
  end
end
