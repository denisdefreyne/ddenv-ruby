# frozen_string_literal: true

module Ddenv
  module Commands
    class Up < Ddenv::Command
      def call
        goal = Goals::HomebrewPackageInstalled.new("vim")

        puts goal.message
        if goal.achieved?
          puts "already achieved"
        else
          goal.achieve
          puts "done"
        end
      end
    end
  end
end
