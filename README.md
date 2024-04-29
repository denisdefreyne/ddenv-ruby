# ddenv

**ddenv** (*Denis’ Developer Environment*) is a tool for maintaining a local
environment for development.

> [!CAUTION]
> This software is a pre-alpha work in progress. Do not use just yet.

## Requirements

- Homebrew
- fish shell

> [!NOTE]
> In the future, this will work for bash and zsh as well.

## Quick start

Install it: `brew install denisdefreyne/ddenv/ddenv`.

Next, create a `ddenv.yaml` file which contains the list of dependencies to manage:

```yaml
up:
  - homebrew: overmind
  - ruby: 3.3.0
```

Lastly, run `ddenv up`.

```
% ddenv up
[✔] Installing Homebrew package overmind    ... done (previously achieved)
[✔] Installing Homebrew package ruby-install... done (previously achieved)
[✔] Installing Ruby v3.3.0                  ... done (previously achieved)
[✔] Initializing Shadowenv                  ... done (previously achieved)
[✔] Creating .shadowenv.d                   ... done (previously achieved)
[✔] Adding .shadowenv.d to .gitignore       ... done (previously achieved)
[✔] Trusting .shadowenv.d                   ... done (previously achieved)
[✔] Adding Ruby to shadowenv                ... done (previously achieved)
[✔] Installing Ruby gem bundler             ... done (previously achieved)
[✔] Installing bundle                       ... done (previously achieved)
%
```

Now your local developer environment is ready to be used.

## Goals

- <code>homebrew: <var>PACKAGENAME</var></code> installs the Homebrew package with the given name.
- <code>ruby: <var>VERSION</var></code> installs the given version of Ruby.
- <code>bundle</code> runs `bundle install`
