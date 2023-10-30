module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token
      #skip_before_action :authenticate_user!, only: [:register_user]

      def register_user
        # Handle the JSON data here
        # Access the JSON data using params[:user]
        user_params = JSON.parse(request.body.read)

        club_name = user_params["GolfClub"]
        club = Club.find_by(name: club_name)
        
        if club.nil?
          render json: { errors: 'Club not found' }, status: :unprocessable_entity
          return
        end

        backend_params = {
          first_name: user_params["Name"],
          last_name: user_params["Surname"],
          email: user_params["Email"],
          phone: user_params["PhoneNumber"],
          password: user_params["Password"],
          password_confirmation: user_params["ConfirmPassword"]
        }
        
        # Perform user registration logic here
        user = User.new(backend_params)
        puts 'added user'
        user.clubs << club
        
        # You can return a response indicating success or failure
        if user.save
          render json: { message: 'User registered successfully' }, status: :created
        else
          Rails.logger.debug user.errors.full_messages.to_sentence
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
