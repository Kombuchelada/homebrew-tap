cask "glowbar" do
  version "1.1.4"
  sha256 "268b3357ec9e0ec12409ffd5477978d06e53856fb9a2760782527774cd9bea0a"

  url "https://github.com/Kombuchelada/glowbar/releases/download/v#{version}/Glowbar-#{version}.zip"
  name "Glowbar"
  desc "Menu bar app for the RGB lighting on GIGABYTE AORUS monitors"
  homepage "https://github.com/Kombuchelada/glowbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Glowbar.app"
  binary "#{appdir}/Glowbar.app/Contents/Resources/glowbar"

  zap trash: "~/Library/Preferences/io.github.kombuchelada.glowbar.plist"

  caveats <<~EOS
    Connect the monitor's USB upstream cable (USB-C or USB-B) to this Mac.
  EOS
end
