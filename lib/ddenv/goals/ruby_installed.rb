# frozen_string_literal: true

module Ddenv
  module Goals
    class RubyInstalled < Goal
      def message
        "Installing Ruby v#{ruby_version}"
      end

      def achieved?
        pathname = Pathname.new(Dir.home) / ".rubies" / "ruby-#{ruby_version}"
        pathname.directory?
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("ruby-install", "--cleanup", ruby_version)
      end

      def pre_goals
        [
          RubyInstallInstalled.new
        ]
      end

      def post_goals
        [
          RubyShadowenvCreated.new(ruby_pathname.to_s, ruby_version)
        ]
      end

      def props
        [ruby_version]
      end

      private

      def ruby_version
        @_ruby_version ||= File.read(".ruby-version").chomp
      end

      def ruby_pathname
        @_ruby_pathname ||= Pathname.new(Dir.home) / ".rubies" / "ruby-#{ruby_version}"
      end
    end
  end
end
