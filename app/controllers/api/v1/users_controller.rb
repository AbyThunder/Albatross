# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      POLICY_CLASS = ::UserPolicy

      before_action :user, only: [:show]

      def show
        authorize(params[:id], :show?)

        render json: user
      end

      def register_user
        club = Club.find_by(name: user_params[:club_id])

        if club.nil?
          render json: { errors: "Club not found for provided ID: #{club}" }, status: :unprocessable_entity
          return
        end

        user = User.new(user_params.except(:club_id))
        user.club = club

        if user.save
          render json: { message: 'User registered successfully' }, status: :created
        else
          render json: { errors: user.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:first_name, :last_name, :email, :phone, :address, :password,
                      :password_confirmation, :club_id)
      end

      def user
        @user ||= User.find(params[:id])
      end
    end
  end
end
