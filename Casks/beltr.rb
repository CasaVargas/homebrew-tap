cask "beltr" do
  version "1.68.5"
  sha256 "f9e3c611852ef5043d48af515e83b4450cfc48f5225ce9aa2b97299b6bec109c"

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
