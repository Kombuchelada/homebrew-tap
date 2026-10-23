cask "glowbar" do
  version "1.1.0"
  sha256 "9fc0b67db59a15b77e0c056b71a93a679714f19248d0c43feafeacee6f571143"

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
    Glowbar isn't notarized, so macOS blocks it the first time it opens.
    Open it once, then click "Open Anyway" in
    System Settings > Privacy & Security. Or run:
      xattr -dr com.apple.quarantine #{appdir}/Glowbar.app

    Connect the monitor's USB upstream cable (USB-C or USB-B) to this Mac.
  EOS
end
