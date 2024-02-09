# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    return true if @current_user.is_a?(Manager)

    @current_user&.id == record.to_i if @current_user.is_a?(User)
  end

  # we'd like only a user to be able to update itself
  alias update? show?
end
