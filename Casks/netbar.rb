cask "netbar" do
  version "1.0.0"
  sha256 "7fde8d41b16de361175d82f72e36521aa1f71e4e98a25a3bbf896dfd96f62385"

  url "https://github.com/Kombuchelada/netbar/releases/download/v#{version}/Netbar-#{version}.zip"
  name "Netbar"
  desc "Menu bar icon showing whether Ethernet or Wi-Fi is in use"
  homepage "https://github.com/Kombuchelada/netbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Netbar.app"

  uninstall quit: "io.github.kombuchelada.netbar"

  zap trash: "~/Library/Preferences/io.github.kombuchelada.netbar.plist"

  caveats <<~EOS
    Netbar isn't notarized, so macOS blocks it the first time it opens.
    Open it once, then click "Open Anyway" in
    System Settings > Privacy & Security. Or run:
      xattr -dr com.apple.quarantine #{appdir}/Netbar.app
  EOS
end
