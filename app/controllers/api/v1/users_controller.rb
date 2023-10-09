module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user!, only: [:create]

      def create
        user = User.new(user_params)
        user.role = :candidate # Set default role to candidate

        if user.save
          render json: { message: 'User was successfully registered.', user: user }, status: :created
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
