# frozen_string_literal: true

require "test_helper"

module Ddenv
  module Goals
    class RubyInstalledTest < Minitest::Test
      def test_blah
        refute_nil "this is not nil"
      end
    end
  end
end
