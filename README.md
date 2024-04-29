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
  - bundle
  - node: 20.12.2
```

Lastly, run `ddenv up`.

```
% ddenv up
[✔] Installing Homebrew package overmind       done (previously achieved)
[✔] Installing Homebrew package ruby-install   done (previously achieved)
[✔] Installing Ruby v3.3.0                     done (previously achieved)
[✔] Initializing Shadowenv                     done (previously achieved)
[✔] Creating .shadowenv.d                      done (previously achieved)
[✔] Adding .shadowenv.d to .gitignore          done (previously achieved)
[✔] Trusting .shadowenv.d                      done (previously achieved)
[✔] Adding Ruby to shadowenv                   done (previously achieved)
[✔] Installing Ruby gem bundler                done (previously achieved)
[✔] Installing bundle                          done (previously achieved)
[✔] Installing Homebrew package node-build     done (previously achieved)
[✔] Installing Node v20.12.2                   done (previously achieved)
[✔] Adding Node to shadowenv                   done (previously achieved)
%
```

Now your local developer environment is ready to be used.

## Goals

- <code>homebrew: <var>PACKAGENAME</var></code> installs the Homebrew package with the given name.
- <code>ruby</code> installs Ruby (with the version specified in the `.ruby-version`
  file).
- <code>bundle</code> runs `bundle install`
- <code>node: <var>VERSION</var></code> installs the give Node.js version
