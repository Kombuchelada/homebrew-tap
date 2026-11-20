cask "netbar" do
  version "1.0.1"
  sha256 "db0008ce83decd2226c23799c614c68c83886ab32d211ac1a612c4786e38e815"

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
end
