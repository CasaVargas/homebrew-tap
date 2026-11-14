# CasaVargas Homebrew Tap

Homebrew casks for the Mac apps from [Casa Vargas](https://casavargas.app/):

| Cask | App | Needs |
|------|-----|-------|
| `nimbus` | [Nimbus](https://casavargas.app/nimbus/), every cloud you use in one window, built on rclone. Free and open source | macOS 15 or later, Apple Silicon or Intel |
| `beltr` | [Beltr](https://beltr.app/), karaoke from the songs you already own | Apple Silicon (M1 or newer) |

Both apps are signed and notarized by Apple.

## Install

```bash
brew trust --tap casavargas/tap && brew tap CasaVargas/tap && brew install --cask nimbus
```

```bash
brew trust --tap casavargas/tap && brew tap CasaVargas/tap && brew install --cask beltr
```

Homebrew 7 refuses to load casks from a tap you haven't trusted, which shows up as
"Invalid cask … Refusing to load cask casavargas/tap/nimbus from untrusted tap". The
`brew trust` step handles that once per machine.

## Updates

Both apps update themselves in place, so the casks are marked `auto_updates true` and
`brew upgrade` leaves them alone. (Nimbus checks for updates only once you turn that on
in its settings, or when you choose Check for Updates.) To force Homebrew to reinstall
the latest release:

```bash
brew upgrade --cask --greedy nimbus
```

## Uninstall

```bash
brew uninstall --cask nimbus
```

Adding `--zap` also deletes the app's data:

- `nimbus`: settings, backup jobs, transfer history and the rclone build Nimbus
  downloaded. Your rclone config (`~/.config/rclone`) and everything in your clouds stay.
- `beltr`: your song library, stems, settings and caches under
  `~/Library/Application Support/Beltr`. Only use it if you want all of that gone.

## Maintenance

The casks are bumped automatically. When a release ships, the `bump-homebrew.yml`
workflow in the app's repo opens a PR here with the new version and sha256, and merges
it once the audit passes. `.github/workflows/audit.yml` runs `brew style` and
`brew audit` on every PR, for every cask.
