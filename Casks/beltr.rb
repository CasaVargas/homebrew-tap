cask "beltr" do
  version "1.67.3"
  sha256 "1cecc787d228aed152ea002c54e8d5a977ffd131cdff3cfc0d3f5647f71b6c58"

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
  depends_on macos: :big_sur

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
