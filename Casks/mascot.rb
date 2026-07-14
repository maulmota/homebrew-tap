cask "mascot" do
  version "2.2.0"
  sha256 "e3e337264950fcdefd584b80c285a6308cb3b9a96302d1c77da9d5a37c803427"

  url "https://github.com/maulmota/mascot-screensaver/releases/download/v#{version}/Mascot.app.zip"
  name "Mascot"
  desc "Desktop pet that keeps your Mac awake (Clawd and friends)"
  homepage "https://github.com/maulmota/mascot-screensaver"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

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
    launch, either right-click Mascot.app and choose Open, or install
    with the quarantine flag skipped:

      brew install --cask --no-quarantine maulmota/tap/mascot
  EOS
end
