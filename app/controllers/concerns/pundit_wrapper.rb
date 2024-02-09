# frozen_string_literal: true

module PunditWrapper
  extend ActiveSupport::Concern

  def authorize(record = nil, query = nil, policy_class: nil)
    super(
      record || resource_class,
      query,
      policy_class: policy_class || self.class::POLICY_CLASS
    )
  end

  def policy_scope(scope = nil, policy_scope_class: nil)
    super(
      scope || resource_class,
      policy_scope_class: policy_scope_class || self.class::POLICY_CLASS::Scope
    )
  end

  private

  def resource_class
    self.class::POLICY_CLASS.name.gsub('Policy', '').constantize
  end
end
