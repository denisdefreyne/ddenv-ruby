# frozen_string_literal: true

module Ddenv
  class CLI
    def initialize(args)
      @args = args
    end

    def call
      if @args.size != 1
        warn "usage: ddenv [command]"
        exit 64 # EX_USAGE
      end

      command_name = @args.first
      case command_name
      when "help"
        Ddenv::Commands::Help.new.call
      when "up"
        Ddenv::Commands::Up.new.call
      else
        warn "ddenv: unknown command: #{command_name}"
        exit 64 # EX_USAGE
      end
    end
  end
end
