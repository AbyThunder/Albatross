# app/controllers/players_controller.rb
class PlayersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # ...
end
