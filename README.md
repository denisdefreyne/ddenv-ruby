# ddenv

**ddenv** (*Denis’ Developer Environment*) is a tool for maintaining a local
environment for development.

> [!CAUTION]
> This software is a pre-alpha work in progress. Do not use just yet.

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
Installing Homebrew package vim...          ok
Installing Homebrew package ruby-install... ok
Installing Ruby v3.3.0...                   ok
Initializing Shadowenv...                   ok
Creating .shadowenv.d...                    ok
Adding .shadowenv.d to .gitignore...        ok
Trusting .shadowenv.d...                    ok
Adding Ruby to shadowenv...                 ok
%
```

Now your local developer environment is ready to be used.
