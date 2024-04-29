# frozen_string_literal: true

module Ddenv
  module Goals
    class ShadowenvDirCreated < Goal
      PATH = ".shadowenv.d"

      def message
        "Creating .shadowenv.d"
      end

      def achieved?
        Pathname.new(PATH).directory?
      end

      def achieve
        FileUtils.mkdir_p(PATH)
      end

      def pre_goals
        [
          Ddenv::Goals::ShadowenvInitialized.new
        ]
      end

      def post_goals
        [
          Ddenv::Goals::ShadowenvDirGitIgnored.new,
          Ddenv::Goals::ShadowenvTrusted.new
        ]
      end
    end
  end
end
