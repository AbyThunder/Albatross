module Api
  module V1
    class HomeblocksController < ApplicationController
      before_action :authenticate_user!
      load_and_authorize_resource

      # GET /api/v1/homeblocks
      def index
        @homeblocks = Homeblock.where(role: current_user.role)
        render json: @homeblocks
      end
    end
  end
end
