cask "mascot" do
  version "2.3.0"
  sha256 "e8350ac45ea6270b87b75b7b5a97ba1fdd1a692c46a124e14e4a9c550e7e56dd"

  url "https://github.com/maulmota/mascot-screensaver/releases/download/v#{version}/Mascot.app.zip"
  name "Mascot"
  desc "Desktop pet that keeps the display awake (Clawd and friends)"
  homepage "https://github.com/maulmota/mascot-screensaver"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Mascot.app"

  uninstall quit: "io.github.maulmota.mascot"

  zap trash: [
    "~/Library/Caches/io.github.maulmota.mascot",
    "~/Library/HTTPStorages/io.github.maulmota.mascot",
    "~/Library/Preferences/io.github.maulmota.mascot.plist",
    "~/Library/Saved Application State/io.github.maulmota.mascot.savedState",
    "~/Library/WebKit/io.github.maulmota.mascot",
  ]

  caveats <<~EOS
    Mascot is ad-hoc signed (not notarized). If macOS blocks the first
    launch, right-click /Applications/Mascot.app and choose Open, or
    clear the quarantine flag:

      xattr -dr com.apple.quarantine /Applications/Mascot.app
  EOS
end
