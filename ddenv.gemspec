# frozen_string_literal: true

require_relative "lib/ddenv/version"

Gem::Specification.new do |spec|
  spec.name = "ddenv"
  spec.version = Ddenv::VERSION
  spec.authors = ["Denis Defreyne"]
  spec.email = ["git@denisdefreyne.com"]

  spec.summary = "Manage local developer environment"
  spec.description = "Creates and maintains an environment for local development, including Ruby and Node versions."
  spec.homepage = "https://github.com/denisdefreyne/ddenv"
  spec.license = "MIT"
  spec.required_ruby_version = "~> 3.3"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/denisdefreyne/ddenv"
  spec.metadata["changelog_uri"] = "https://github.com/denisdefreyne/ddenv/blob/main/NEWS.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "cri", "~> 2.15"
  spec.add_dependency "tty-command", "~> 0.10"
  spec.add_dependency "tty-spinner", "~> 0.9"
end
