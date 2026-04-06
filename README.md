# Nimblesite Homebrew Tap

Homebrew formulas for [Nimblesite](https://nimblesite.co) tools.

## Usage

Tap once:

```bash
brew tap nimblesite/tap
```

Then install any of the tools:

```bash
brew install dart_mutant
# brew install basilisk    # coming soon
# brew install forge       # coming soon
```

Or install directly without tapping first:

```bash
brew install nimblesite/tap/dart_mutant
```

## Available formulas

| Formula | Description | Repo |
|---------|-------------|------|
| `dart_mutant` | Mutation testing tool for Dart | [Nimblesite/dart_mutant](https://github.com/Nimblesite/dart_mutant) |

## Updating

Each project's `release.yml` workflow updates its own formula in this tap on
release. Do not edit formulas by hand unless you know what you're doing.

## License

Each formula's license matches its upstream project. Tap metadata is MIT.
