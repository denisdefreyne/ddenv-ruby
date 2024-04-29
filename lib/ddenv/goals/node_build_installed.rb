# frozen_string_literal: true

module Ddenv
  module Goals
    module NodeBuildInstalled
      def self.new
        Ddenv::Goals::HomebrewPackageInstalled.new("node-build")
      end
    end
  end
end
