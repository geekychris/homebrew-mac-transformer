cask "mac-transformer" do
  version "0.1.1"
  sha256 "fd3a7f02591e9662a8206229d849f502d5390e5e96828e003583947fcc4aea3b"

  url "https://github.com/geekychris/mac_transformer/releases/download/v#{version}/mac-transformer-#{version}.dmg"
  name "Mac Transformer"
  desc "Convert docs to PDF/text/audio/summary; publish to Books, Music, Reading List, Obsidian, Notion"
  homepage "https://github.com/geekychris/mac_transformer"

  # macOS 12 (Monterey) or newer.
  depends_on macos: ">= :monterey"

  app "Mac Transformer.app"

  # Companion CLI. Not required — the app works standalone. If a matching
  # `mt` binary is shipped in the release, symlink it into a bin dir.
  # binary "Mac Transformer.app/Contents/Resources/mt", target: "mt"

  # Register the .app with Launch Services so Finder sees the document
  # types declared in Info.plist (Open With → Mac Transformer).
  postflight do
    system "/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister",
           "-f", "#{appdir}/Mac Transformer.app"
  end

  uninstall quit:      "com.geekychris.mac-transformer",
            launchctl: "com.geekychris.mac-transformer",
            delete:    [
              "/Applications/Mac Transformer.app",
            ]

  zap trash: [
    "~/.mac-transformer",
    "~/Library/Application Support/MacTransformer",
    "~/Library/Services/MacTransformer.workflow",
  ]
end
