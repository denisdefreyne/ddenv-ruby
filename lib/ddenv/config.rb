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
            [element, nil]
          end

        case key
        when "homebrew"
          Goals::HomebrewPackageInstalled.new(value)
        when "ruby"
          Goals::RubyInstalled.new
        when "node"
          Goals::NodeInstalled.new(value)
        when "bundle"
          Goals::BundleInstalled.new
        when "npm"
          Goals::NpmPackesInstalled.new
        else
          raise "unknown key: #{key}"
        end
      end
    end
  end
end
