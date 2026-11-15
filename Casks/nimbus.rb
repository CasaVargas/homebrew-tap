cask "nimbus" do
  version "1.4.1"
  sha256 "3ad8546136576b2693647f0f037913d2351d951f6bb1659de2b6d25d16766787"

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
