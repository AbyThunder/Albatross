module Api
  module V1
    class BaseController < ApplicationController
      # Turn off CSRF protection for APIs
      # protect_from_forgery with: :null_session
      skip_before_action :verify_authenticity_token

      # Methods specific to V1 of your API

      # Common error handlers, authentication methods, etc.
      before_action :authenticate_api_request!

      private

      def authenticate_api_request!
        # Your authentication logic, like token-based authentication
      end

      # ... other shared methods or filters ...
    end
  end
end
