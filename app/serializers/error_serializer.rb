# frozen_string_literal: true

class ErrorSerializer < ActiveModel::Serializer
  attributes :model, :source, :message
end
