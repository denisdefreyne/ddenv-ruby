# frozen_string_literal: true

module Ddenv
  module Goals
    class NodeShadowenvCreated < Goal
      PATH = ".shadowenv.d/20_node.lisp"

      def initialize(node_version, node_path)
        super()

        @node_version = node_version
        @node_path = node_path
      end

      def message
        "Adding Node to shadowenv"
      end

      def achieved?
        File.file?(PATH) && File.read(PATH) == shadowenv_contents
      end

      def achieve
        File.write(PATH, shadowenv_contents)

        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("shadowenv", "trust")
      end

      def pre_goals
        [
          Ddenv::Goals::ShadowenvDirCreated.new
        ]
      end

      def props
        [@node_version, @node_path]
      end

      private

      def shadowenv_contents
        <<~CONTENTS
          (provide "node" "#{@node_version}")

          (env/prepend-to-pathlist "PATH" "#{@node_path}/bin")
        CONTENTS
      end
    end
  end
end
