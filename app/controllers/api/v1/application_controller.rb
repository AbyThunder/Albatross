# frozen_string_literal: true

class Api::V1::ApplicationController < ActionController::API
  before_action :snake_case_params

  include Pundit::Authorization
  include PunditWrapper

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(exception)
    error = Error.new(
      model: exception.model,
      source: exception.model,
      message: exception.message
    )

    render json: error, status: :not_found
  end

  def unauthorized_user(exception)
    error = Error.new(
      model: Error,
      source: '',
      message: exception.message
    )

    render json: error, status: :forbidden
  end

  def snake_case_params
    request.parameters.deep_transform_keys!(&:underscore)
  end
end
