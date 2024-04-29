# frozen_string_literal: true

module Ddenv
  module Goals
    class ShadowenvInitialized < Goal
      FISH_LINE = "shadowenv init fish | source"

      def message
        "Initializing Shadowenv"
      end

      # TODO: support bash and zsh

      def achieved?
        fish_config = File.read(fish_config_path)
        fish_config.lines.any? { _1.chomp == FISH_LINE }
      end

      def achieve
        File.write(fish_config_path, "\n\n#{FISH_LINE}", mode: "a+")
      end

      private

      def fish_config_path
        @_fish_config_path ||= File.expand_path("~/.config/fish/config.fish")
      end
    end
  end
end
