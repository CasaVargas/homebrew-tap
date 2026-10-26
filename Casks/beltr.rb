cask "beltr" do
  version "1.72.0"
  sha256 "20531b6bbdece69bf8eab4a09cbf5abb9bd01bdc3c9e9b04a21f13585cfeccca"

  url "https://github.com/CasaVargas/beltr-releases/releases/download/v#{version}/Beltr-#{version}-arm64.dmg"
  name "Beltr"
  desc "Karaoke from your own music with on-device vocal separation"
  homepage "https://beltr.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Beltr.app"

  zap trash: [
    "~/Library/Application Support/Beltr",
    "~/Library/Caches/beltr-updater",
    "~/Library/Caches/com.beltr.karaoke",
    "~/Library/Caches/com.beltr.karaoke.ShipIt",
    "~/Library/HTTPStorages/com.beltr.karaoke",
    "~/Library/Logs/Beltr",
    "~/Library/Preferences/com.beltr.karaoke.plist",
    "~/Library/Saved Application State/com.beltr.karaoke.savedState",
  ]
end
