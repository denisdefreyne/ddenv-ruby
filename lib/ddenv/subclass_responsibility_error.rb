# frozen_string_literal: true

module Ddenv
  class SubclassResponsibilityError < StandardError
    def initialize(klass, method_name)
      super("Subclasses of #{klass} must implement the ##{method_name} method.")
    end
  end
end
