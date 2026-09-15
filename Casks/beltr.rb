cask "beltr" do
  version "1.66.4"
  sha256 "7de6dac4ec2f11f74fdee3f1860f3118c1327dc081644683c0129c55d03dd207"

  url "https://github.com/CasaVargas/beltr-releases/releases/download/v#{version}/Beltr-#{version}-arm64.dmg",
      verified: "github.com/CasaVargas/beltr-releases/"
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
