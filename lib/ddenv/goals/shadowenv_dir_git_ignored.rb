# frozen_string_literal: true

module Ddenv
  module Goals
    class ShadowenvDirGitIgnored < Goal
      PATH = ".shadowenv.d/.gitignore"
      CONTENTS = "*\n"

      def message
        "Adding .shadowenv.d to .gitignore"
      end

      def achieved?
        File.file?(PATH) && File.read(PATH) == CONTENTS
      end

      def achieve
        File.write(PATH, CONTENTS)
      end
    end
  end
end
