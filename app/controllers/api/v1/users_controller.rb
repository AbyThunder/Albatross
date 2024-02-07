module Api
  module V1
    class UsersController < BaseController
      skip_before_action :verify_authenticity_token
      #skip_before_action :authenticate_user!, only: [:register_user]

      def register_user
        # Handle the JSON data here
        # Access the JSON data using params[:user]
        user_params = JSON.parse(request.body.read)

        # club_name = user_params["Golf Clubs"]
        # club = Club.find_by(name: club_name)
        
        # if club.nil?
        #   render json: { errors: 'Club not found' }, status: :unprocessable_entity
        #   return
        # end

        frontend_params = {
          first_name: user_params["Name"],
          last_name: user_params["Surname"],
          email: user_params["Email"],
          phone: user_params["Phone Number"],
          address: user_params["Address"],
          password: user_params["Password"],
          password_confirmation: user_params["Repeat Password"],
          role: :applied
        }

        # Perform user registration logic here
        user = User.new(frontend_params)
        # user.clubs << club
        
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
