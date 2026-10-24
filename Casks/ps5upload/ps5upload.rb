cask "ps5upload" do
  version "7.4.3"

  on_arm do
    sha256 "6fb95cf2493e7e9355b761dfcd38e2cf4dd9061fb791eb55e847d0756f9f1516"

    url "https://github.com/phantomptr/ps5upload/releases/download/v#{version}/PS5Upload-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "1f517176a69127fea2b1b1d00a12f9bc24c418bc9e98993958acd63d25438025"

    url "https://github.com/phantomptr/ps5upload/releases/download/v#{version}/PS5Upload-#{version}-mac-x64.dmg"
  end

  name "PS5Upload"
  desc "Send games, apps and homebrew to a jailbroken PS5"
  homepage "https://github.com/phantomptr/ps5upload"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "PS5Upload.app"

  zap trash: [
    "~/.ps5upload",
    "~/Library/Application Support/com.phantomptr.ps5upload",
    "~/Library/Caches/com.phantomptr.ps5upload",
    "~/Library/Saved Application State/com.phantomptr.ps5upload.savedState",
    "~/Library/WebKit/com.phantomptr.ps5upload",
  ]

  caveats <<~EOS
    #{token} is not signed or notarized, so macOS will block it on first launch.
    To allow it, either:
      - open it once, then go to System Settings > Privacy & Security and
        click "Open Anyway" (right-click > Open no longer works on macOS 15+), or
      - run:
          xattr -dr com.apple.quarantine "#{appdir}/PS5Upload.app"
  EOS
end
