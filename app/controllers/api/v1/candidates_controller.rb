module Api
  module V1
    class CandidatesController < BaseController
      skip_before_action :verify_authenticity_token
      #skip_before_action :authenticate_user!, only: [:create, :register_user]

      def register_user
        # Handle the JSON data here
        # Access the JSON data using params[:user]
        frontend_params = JSON.parse(request.body.read)
        
        # Remap the parameters
        backend_params = {
          name: "#{frontend_params["Name"]} #{frontend_params["Surname"]}",
          email: frontend_params["Email"],
          phone: frontend_params["PhoneNumber"],
          # Assuming you have a method or variable to determine the academy_id
          academy_id: ["GolfClub"]
        }

        user = Candidate.new(backend_params)
        
        # You can return a response indicating success or failure
        if user.save
          render json: { message: 'User registered successfully' }, status: :created
        else
          Rails.logger.debug user.errors.full_messages.to_sentence
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def get_academy_id_from(golf_club_name)
        # You'll need to determine how to get the academy_id from the GolfClub parameter or any other logic you might have.
        # For now, I'm returning a placeholder.
        # Replace this logic accordingly.
        #Academy.find_by(name: golf_club_name)&.id
      end

      def user_params
        params.require(:candidate).permit(:email)
      end
    end
  end
end
