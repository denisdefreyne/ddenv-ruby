# frozen_string_literal: true

module Ddenv
  module Goals
    class ShadowenvTrusted < Goal
      def message
        "Trusting .shadowenv.d"
      end

      def achieved?
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        begin
          cmd.run("shadowenv", "exec", "--", "ls")
        rescue StandardError
          return false
        end
        true
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("shadowenv", "trust")
      end
    end
  end
end
