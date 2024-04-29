# frozen_string_literal: true

module Ddenv
  module Goals
    class BundleInstalled < Goal
      def message
        "Installing bundle"
      end

      def achieved?
        cmd = TTY::Command.new(printer: :null)
        cmd.run("shadowenv", "exec", "--", "bundle", "check")
        true
      rescue StandardError
        false
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("shadowenv", "exec", "--", "bundle", "install")
      end

      def pre_goals
        [
          GemInstalled.new("bundler")
        ]
      end
    end
  end
end
