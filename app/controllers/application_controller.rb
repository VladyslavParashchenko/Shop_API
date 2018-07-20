# frozen_string_literal: true

require "helpers/render_helper"

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Json_Helper
  include Pundit
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :permission_denied_answer
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied_answer
  rescue_from Stripe::StripeError, with: :stripe_error_handler

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :birthday, :password, :password_confirmation, :allow_password_change, :confirmed_at])
    end
    def permission_denied_answer
      render_error({ error: "You do not have rights to this action" }, 400)
    end
    def stripe_error_handler(e)
      render_error(e, 403)
    end
end
