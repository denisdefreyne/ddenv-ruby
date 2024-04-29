# frozen_string_literal: true

module Ddenv
  module Goals
    module RubyInstallInstalled
      def self.new
        Ddenv::Goals::HomebrewPackageInstalled.new("ruby-install")
      end
    end
  end
end
