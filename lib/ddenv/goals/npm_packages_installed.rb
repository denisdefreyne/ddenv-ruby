# frozen_string_literal: true

module Ddenv
  module Goals
    class NpmPackesInstalled < Goal
      def message
        "Installing npm packages"
      end

      def achieved?
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("shadowenv", "exec", "--", "npx", "check-dependencies")
        true
      rescue StandardError
        false
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("shadowenv", "exec", "--", "npm", "install")
      end
    end
  end
end
