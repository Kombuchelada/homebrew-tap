cask "fan-control" do
  version "1.0.2"
  sha256 "00e60cef8bd7d0c2c9920efa66d89e8968320cd3790ee11c1e2a59b584ffaac3"

  url "https://github.com/Kombuchelada/fan-control/releases/download/v#{version}/Fan-Control.zip"
  name "Fan Control"
  desc "Menu bar app for choosing fan speed curves"
  homepage "https://github.com/Kombuchelada/fan-control"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :x86_64
  depends_on macos: :sonoma

  app "Fan Control.app"

  # Quitting hands the fans back to macOS. The privileged helper stays installed so
  # upgrades don't ask for an administrator password again; `zap` removes it.
  uninstall quit: "app.fancontrol.FanControl"

  zap launchctl: "app.fancontrol.helper",
      delete:    [
        "/Library/LaunchDaemons/app.fancontrol.helper.plist",
        "/Library/PrivilegedHelperTools/app.fancontrol.helper",
      ],
      trash:     "~/Library/Preferences/app.fancontrol.FanControl.plist"

  caveats <<~EOS
    Fan Control supports Intel Macs only.

    The first time you choose a fan curve, Fan Control asks for an administrator
    password to install the helper that sets fan speeds. To remove the helper
    along with the app, run:
      brew uninstall --zap --cask fan-control
  EOS
end
