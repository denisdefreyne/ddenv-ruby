# frozen_string_literal: true

module Ddenv
  module Commands
    class Up < Ddenv::Command
      def call
        config = Ddenv::Config.read_from_file("ddenv.yaml")

        all_goals = config.goals.flat_map(&:with_pre_and_post_goals).uniq

        max_message_size = all_goals.map { _1.message.size }.max

        all_goals.each do |goal|
          spinner = TTY::Spinner.new("[:spinner] :message... :title")
          spinner.update(message: format("%-#{max_message_size}s", goal.message))
          spinner.update(title: "checking")
          spinner.auto_spin

          if goal.achieved?
            spinner.update(title: "done (previously achieved)")
          else
            spinner.update(title: "working...")
            goal.achieve
            spinner.update(title: "done (newly achieved)")
          end
          spinner.success
        end
      end
    end
  end
end
