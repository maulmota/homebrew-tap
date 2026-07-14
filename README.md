# maulmota/tap

Homebrew tap for [maulmota](https://github.com/maulmota)'s tools.

## Install

```bash
brew install --cask maulmota/tap/mascot
```

The app is ad-hoc signed (not notarized), so either right-click → Open on
first launch, or skip the quarantine flag at install time:

```bash
brew install --cask --no-quarantine maulmota/tap/mascot
```

## Casks

| Cask | Description |
|---|---|
| [`mascot`](Casks/mascot.rb) | [Mascot](https://github.com/maulmota/mascot-screensaver): a desktop pet that keeps your Mac awake (Clawd and friends) |

## Releasing a new Mascot version

After publishing a GitHub release with a `Mascot.app.zip` asset:

```bash
./bump-mascot.sh 2.3.0
```

That rewrites `Casks/mascot.rb` with the new version and checksum; review
and push.
