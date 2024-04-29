# frozen_string_literal: true

module Ddenv
  module Goals
    class HomebrewPackageInstalled < Goal
      attr_reader :package_name

      def initialize(package_name)
        super()
        @package_name = package_name
      end

      def message
        "Installing Homebrew package #{@package_name}"
      end

      def achieved?
        Homebrew.package_installed?(@package_name)
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("brew", "install", @package_name)
      end

      def props
        [@package_name]
      end
    end
  end
end
