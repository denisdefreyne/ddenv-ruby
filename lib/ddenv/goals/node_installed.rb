# frozen_string_literal: true

module Ddenv
  module Goals
    class NodeInstalled < Goal
      attr_reader :node_version

      def initialize(node_version)
        super()

        @node_version = node_version.to_s
      end

      def message
        "Installing Node v#{node_version}"
      end

      def achieved?
        node_pathname.directory?
      end

      def achieve
        # TODO: use :pretty when passing --verbose
        cmd = TTY::Command.new(printer: :null)
        cmd.run("node-build", node_version, node_pathname.to_s)
      end

      def pre_goals
        [
          NodeBuildInstalled.new
        ]
      end

      def post_goals
        [
          NodeShadowenvCreated.new(node_version, node_pathname.to_s)
        ]
      end

      private

      def node_pathname
        @_node_pathname ||= Pathname.new(Dir.home) / ".node-versions" / node_version
      end
    end
  end
end
