# frozen_string_literal: true

class AcademyPolicy < ApplicationPolicy
  def create?
    return true if @current_user.is_a?(Manager)
  end

  alias create?
end
