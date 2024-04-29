# frozen_string_literal: true

module Ddenv
  module Commands
    class Up < Ddenv::Command
      def call
        config = Ddenv::Config.read_from_file("dev.yml")

        all_goals = config.goals.flat_map(&:with_pre_and_post_goals).uniq

        all_goals.each do |goal|
          puts goal.message
          puts "  Checking..."
          if goal.achieved?
            puts "  Already achieved."
          else
            puts "  Achieving..."
            goal.achieve
            puts "  Newly achieved."
          end
          puts
        end
      end
    end
  end
end
