class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user! # Ensure users are authenticated
  # load_and_authorize_resource # Enable CancanCan
end
