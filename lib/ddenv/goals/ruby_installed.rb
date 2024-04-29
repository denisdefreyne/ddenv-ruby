# frozen_string_literal: true

module Ddenv
  module Goals
    class RubyInstalled < Goal
      def initialize(ruby_version)
        super()
        @ruby_version = ruby_version
      end

      def message
        "Installing Ruby v#{@ruby_version}"
      end

      def achieved?
        pathname = Pathname.new(Dir.home) / ".rubies" / "ruby-#{@ruby_version}"
        pathname.directory?
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("ruby-install", "--cleanup", @ruby_version)
      end

      def pre_goals
        [
          RubyInstallInstalled.new
        ]
      end

      def props
        [@ruby_version]
      end
    end
  end
end
