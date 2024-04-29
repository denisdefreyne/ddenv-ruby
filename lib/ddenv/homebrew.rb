# frozen_string_literal: true

module Ddenv
  module Homebrew
    module_function

    def package_installed?(package_name)
      # TODO: use :pretty when passing --verbose
      cmd = TTY::Command.new(printer: :null)

      stdout, _stderr = cmd.run("brew", "info", "--json", package_name)
      info = JSON.parse(stdout)

      !info[0].fetch("installed").empty?
    end
  end
end
