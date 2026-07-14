cask "mascot" do
  version "2.3.3"
  sha256 "424be810a09adfcbfb445b111df234ddac1a999fb47e481ad3161af4b0daf447"

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
