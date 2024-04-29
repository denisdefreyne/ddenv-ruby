# frozen_string_literal: true

module Ddenv
  class CLI
    ROOT_CMD = Cri::Command.new_basic_root.modify do
      name        "ddenv"
      usage       "ddenv [options] [command] [options]"
      summary     "manage developer environment"
      description "Manages your local developer environment."
    end

    ROOT_CMD.define_command("up") do
      name        "up"
      usage       "up [options]"
      summary     "bring up developer environment"
      description "Brings up the local developer environment to be in line what is described in the ddenv.yaml configuration file."

      flag   :h,  :help, "show help for this command" do |_value, cmd|
        puts cmd.help
        exit 0
      end

      run do |_opts, _args, _cmd|
        Ddenv::Commands::Up.new.call
      end
    end

    def initialize(args)
      @args = args
    end

    def call
      ROOT_CMD.run(@args)
    end
  end
end
