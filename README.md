# homebrew-mac-transformer

Homebrew tap for [Mac Transformer](https://github.com/geekychris/mac_transformer) — a menu-bar app that converts documents to PDF/text/audio/summary via a pluggable pipeline, with optional publishing to Apple Books, Apple Music, Safari Reading List, Obsidian, and Notion.

## Install

```sh
brew tap geekychris/mac-transformer && brew install --cask mac-transformer
```

That's it. Homebrew will auto-tap the formula the first time, then install the latest signed + notarized DMG.

Requires macOS 12 (Monterey) or newer.

## Update

```sh
brew upgrade --cask mac-transformer
```

## Uninstall

```sh
brew uninstall --cask mac-transformer

# Also remove all user data (jobs history, config, plugins):
brew uninstall --zap --cask mac-transformer
```

## What's included

- `Mac Transformer.app` in `/Applications`
- Registered with Launch Services (`Open With` in Finder works)
- All 13 bundled converter plugins
- The Automator "Send to Mac Transformer" Service (offered on first launch)

## What's NOT included

You'll typically want at least some of these — install any you use:

```sh
brew install pandoc poppler ffmpeg
brew install --cask libreoffice basictex
gem install asciidoctor-pdf
```

The app auto-detects what's installed and marks the corresponding plugins available. Nothing is required — if you only have Word installed, only the Word-based plugins will show green, and the rest wait.

For neural TTS (optional), install [Kokoro](https://github.com/geekychris/kokoro_runtime):

```sh
curl -fsSL https://raw.githubusercontent.com/geekychris/kokoro_runtime/main/scripts/install.sh | KOKORO_AUTO_INSTALL=1 bash
```

## Reporting issues

- Bugs and feature requests: [github.com/geekychris/mac_transformer/issues](https://github.com/geekychris/mac_transformer/issues)
- Issues specific to the Homebrew install: [github.com/geekychris/homebrew-mac-transformer/issues](https://github.com/geekychris/homebrew-mac-transformer/issues)
