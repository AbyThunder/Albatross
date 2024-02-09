# frozen_string_literal: true

class Error
  attr_reader :source, :model, :message

  def initialize(model: nil, source: nil, message: nil)
    @model = model
    @source = source
    @message = message
  end

  def self.model_name
    to_s
  end

  alias read_attribute_for_serialization send
end
