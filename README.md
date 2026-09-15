# CasaVargas Homebrew Tap

Homebrew casks for [Beltr](https://beltr.app/), karaoke from the songs you already own.

## Install

```bash
brew trust --tap casavargas/tap && brew tap CasaVargas/tap && brew install --cask beltr
```

Homebrew 7 refuses to load casks from a tap you haven't trusted, which shows up as
"Invalid cask … Refusing to load cask casavargas/tap/beltr from untrusted tap". The
`brew trust` step handles that once per machine.

Requires an Apple Silicon Mac (M1 or newer). The app is signed and notarized by Apple.

## Updates

Beltr updates itself in place, so the cask is marked `auto_updates true` and
`brew upgrade` leaves it alone. To force Homebrew to reinstall the latest release:

```bash
brew upgrade --cask --greedy beltr
```

## Uninstall

```bash
brew uninstall --cask beltr
```

`brew uninstall --zap --cask beltr` also deletes your song library, stems, settings and
caches under `~/Library/Application Support/Beltr`. Only use it if you want all of that gone.

## Maintenance

`Casks/beltr.rb` is bumped automatically: when a Beltr release finishes building, the
`bump-homebrew.yml` workflow in the Beltr repo opens a PR here with the new version and
sha256. `.github/workflows/audit.yml` runs `brew style` and `brew audit` on every PR.
