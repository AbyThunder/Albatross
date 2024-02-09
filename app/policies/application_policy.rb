# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(current_user, record)
    @current_user = current_user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class BaseScope
    def initialize(user, scope = source_scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    def source_scope
      self.class.parent.name.gsub('Policy', '').constantize
    end

    private

    attr_reader :current_user, :scope
  end
end
