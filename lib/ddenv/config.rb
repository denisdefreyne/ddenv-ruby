# frozen_string_literal: true

module Ddenv
  class Config
    def initialize(hash)
      @hash = hash
    end

    def self.read_from_file(filename)
      new(YAML.safe_load(File.read(filename)))
    end

    def goals
      up = @hash.fetch("up", [])

      up.map do |element|
        key, value =
          case element
          when Hash
            [element.keys.first, element.values.first]
          when String
            # TODO: for later
            # (when a goal has no extra details)
          end

        case key
        when "homebrew"
          Goals::HomebrewPackageInstalled.new(value)
        end
      end
    end
  end
end
