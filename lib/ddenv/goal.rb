# frozen_string_literal: true

module Ddenv
  class Goal
    def initialize; end

    def message
      raise SubclassResponsibilityError.new(self.class, __method__)
    end

    def achieved?
      raise SubclassResponsibilityError.new(self.class, __method__)
    end

    def achieve
      raise SubclassResponsibilityError.new(self.class, __method__)
    end
  end
end
