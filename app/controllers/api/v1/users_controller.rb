module Api
  module V1
    class UsersController < ApplicationController
      #skip_before_action :authenticate_user!, only: [:create, :register_user]

      def create
        user = User.new(user_params)
        user.role = :candidate # Set default role to candidate

        if user.save
          render json: { message: 'User was successfully registered.', user: user }, status: :created
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def register_user
        # Handle the JSON data here
        # Access the JSON data using params[:user]
        user_params = JSON.parse(request.body.read)
        
        # Perform user registration logic here
        user = User.new(user_params)
        
        # You can return a response indicating success or failure
        if user_registered_successfully
          render json: { message: 'User registered successfully' }, status: :created
        else
          render json: { errors: 'User registration failed' }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
