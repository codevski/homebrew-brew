cask "ps5upload" do
  version "10.7.1"

  on_arm do
    sha256 "a523ecde62826726411e42906e358372109dd93ca58d372c4f6cee2690090648"

    url "https://github.com/phantomptr/ps5upload/releases/download/v#{version}/PS5Upload-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "ed72199c3054b3b42c8f4d310589fc925545a70b39b404420b9f5c8222b82b90"

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
