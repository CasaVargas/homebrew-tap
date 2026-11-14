cask "nimbus" do
  version "1.2.2"
  sha256 "22b91e573a875aba09e98859d2e0e768bab36bad25f20059f782a9c01a691a90"

  url "https://github.com/CasaVargas/Nimbus/releases/download/v#{version}/Nimbus-#{version}.dmg"
  name "Nimbus"
  desc "Cloud storage manager built on rclone, with Finder integration"
  homepage "https://casavargas.app/nimbus/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Nimbus.app"

  uninstall launchctl: "app.casavargas.nimbus.backups",
            quit:      "app.casavargas.nimbus"

  # rclone's own config (~/.config/rclone) is left alone: the rclone command
  # line shares it.
  zap trash: [
    "~/Library/Application Scripts/53MUTM55LC.app.casavargas.nimbus",
    "~/Library/Application Scripts/app.casavargas.nimbus.FileProvider",
    "~/Library/Application Scripts/group.app.casavargas.nimbus",
    "~/Library/Application Support/Nimbus",
    "~/Library/Caches/app.casavargas.nimbus",
    "~/Library/Containers/app.casavargas.nimbus.FileProvider",
    "~/Library/Group Containers/53MUTM55LC.app.casavargas.nimbus",
    "~/Library/Group Containers/group.app.casavargas.nimbus",
    "~/Library/HTTPStorages/app.casavargas.nimbus",
    "~/Library/Preferences/app.casavargas.nimbus.plist",
  ]
end
