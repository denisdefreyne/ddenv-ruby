# frozen_string_literal: true

module Ddenv
  module Goals
    class RubyShadowenvCreated < Goal
      PATH = ".shadowenv.d/10_ruby.lisp"

      def initialize(ruby_version, ruby_path)
        super()
        @ruby_version = ruby_version
        @ruby_path = ruby_path
      end

      def message
        "Adding Ruby to shadowenv"
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
        [@ruby_version, @ruby_path]
      end

      private

      def shadowenv_contents
        <<~CONTENTS
          (provide "ruby" "#{@ruby_version}")

          (when-let ((ruby-root (env/get "RUBY_ROOT")))
          (env/remove-from-pathlist "PATH" (path-concat ruby-root "bin"))
          (when-let ((gem-root (env/get "GEM_ROOT")))
            (env/remove-from-pathlist "PATH" (path-concat gem-root "bin")))
          (when-let ((gem-home (env/get "GEM_HOME")))
            (env/remove-from-pathlist "PATH" (path-concat gem-home "bin"))))

          (env/set "GEM_PATH" ())
          (env/set "GEM_HOME" ())
          (env/set "RUBYOPT" ())

          (env/set "RUBY_ROOT" "#{@ruby_path}")
          (env/prepend-to-pathlist "PATH" "#{@ruby_path}/bin")
          (env/set "RUBY_ENGINE" "ruby")
          (env/set "RUBY_VERSION" "#{@ruby_version}")
          (env/set "GEM_ROOT" "#{@ruby_path}/lib/ruby/gems/#{@ruby_version}")

          (when-let ((gem-root (env/get "GEM_ROOT")))
            (env/prepend-to-pathlist "GEM_PATH" gem-root)
            (env/prepend-to-pathlist "PATH" (path-concat gem-root "bin")))

          (let ((gem-home
                (path-concat (env/get "HOME") ".gem" (env/get "RUBY_ENGINE") (env/get "RUBY_VERSION"))))
            (do
              (env/set "GEM_HOME" gem-home)
              (env/prepend-to-pathlist "GEM_PATH" gem-home)
              (env/prepend-to-pathlist "PATH" (path-concat gem-home "bin"))))
        CONTENTS
      end
    end
  end
end
