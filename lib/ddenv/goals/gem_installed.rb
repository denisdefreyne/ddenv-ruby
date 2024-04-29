# frozen_string_literal: true

module Ddenv
  module Goals
    class GemInstalled < Goal
      def initialize(gem_name)
        super()
        @gem_name = gem_name
      end

      def message
        "Installing Ruby gem #{@gem_name}"
      end

      def achieved?
        cmd = TTY::Command.new(printer: :null)
        stdout, _stderr = cmd.run("shadowenv", "exec", "--", "gem", "list", "-i", "^#{@gem_name}$")
        stdout.chomp == "true"
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("shadowenv", "exec", "--", "gem", "install", @gem_name)
      end

      def props
        [@gem_name]
      end
    end
  end
end
