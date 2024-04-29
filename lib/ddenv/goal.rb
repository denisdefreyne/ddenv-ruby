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

    def pre_goals
      []
    end

    def post_goals
      []
    end

    def with_pre_and_post_goals
      [
        *pre_goals.flat_map(&:with_pre_and_post_goals),
        self,
        *post_goals.flat_map(&:with_pre_and_post_goals)
      ]
    end

    def props
      []
    end

    def ==(other)
      self.class == other.class && props == other.props
    end

    def eql?(other)
      self == other
    end

    def hash
      [self.class, props].hash
    end
  end
end
