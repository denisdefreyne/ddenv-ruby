# frozen_string_literal: true

module Ddenv
  class Command
    def call
      raise SubclassResponsibilityError.new(self.class, __method__)
    end
  end
end
