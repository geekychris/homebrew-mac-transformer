cask "mac-transformer" do
  version "0.1.0"
  sha256 "e35f21a78c30236f1e712ca48fa983d6a7192a73b6f7e51a3c324ac93ea4b95f"

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

  uninstall quit:      "com.chris.mac-transformer",
            launchctl: "com.chris.mac-transformer",
            delete:    [
              "/Applications/Mac Transformer.app",
            ]

  zap trash: [
    "~/.mac-transformer",
    "~/Library/Application Support/MacTransformer",
    "~/Library/Services/MacTransformer.workflow",
  ]
end
