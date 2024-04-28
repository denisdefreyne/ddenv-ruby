# frozen_string_literal: true

require_relative "ddenv/version"

module Ddenv
  def self.call
    puts "ddenv #{Ddenv::VERSION}"
  end
end
