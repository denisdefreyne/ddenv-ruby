# frozen_string_literal: true

module Ddenv
  module Commands
    class Up < Ddenv::Command
      def call
        config = Ddenv::Config.read_from_file("dev.yml")

        config.goals.each do |goal|
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
