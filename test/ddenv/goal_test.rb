# frozen_string_literal: true

require "test_helper"

module Ddenv
  class GoalTest < Minitest::Test
    class ComplexGoal < Goal
      def pre_goals
        [Sub1.new]
      end

      def post_goals
        [Sub9.new]
      end
    end

    class Sub1 < Goal
      def pre_goals
        [Sub1Dot1.new]
      end

      def post_goals
        [Sub1Dot9.new]
      end
    end

    class Sub1Dot1 < Goal
    end

    class Sub1Dot9 < Goal
    end

    class Sub9 < Goal
      def pre_goals
        [Sub9Dot1.new]
      end

      def post_goals
        [Sub9Dot9.new]
      end
    end

    class Sub9Dot1 < Goal
    end

    class Sub9Dot9 < Goal
    end

    def test_pre_goals
      goal = Ddenv::Goal.new
      assert_empty goal.pre_goals
    end

    def test_post_goals
      goal = Ddenv::Goal.new
      assert_empty goal.post_goals
    end

    def test_with_pre_and_post_goals
      goal = ComplexGoal.new

      goals = goal.with_pre_and_post_goals
      assert_equal 7, goals.size
      assert_equal Sub1Dot1, goals[0].class
      assert_equal Sub1, goals[1].class
      assert_equal Sub1Dot9, goals[2].class
      assert_equal ComplexGoal, goals[3].class
      assert_equal Sub9Dot1, goals[4].class
      assert_equal Sub9, goals[5].class
      assert_equal Sub9Dot9, goals[6].class
    end
  end
end
