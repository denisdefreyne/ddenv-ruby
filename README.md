# ddenv

**ddenv** (*Denis’ Developer Environment*) is a tool for maintaining a local
environment for development.

> [!CAUTION]
> This software is a pre-alpha work in progress. Do not use just yet.

## Quick start

Install it: `brew install denisdefreyne/ddenv/ddenv`.

Next, create a `dev.yml` file which contains the list of dependencies to manage:

```yaml
up:
  - homebrew: overmind
  - ruby: 3.3.0
```

> [!NOTE]
> dev.yml will be renamed to ddenv.yaml soon.

Lastly, run `ddenv up`.
