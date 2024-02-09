# frozen_string_literal: true

class Manager < User
  enum status: { approved: 0 }
end
