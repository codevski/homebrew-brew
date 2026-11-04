cask "ps5upload" do
  version "11.0.8"

  on_arm do
    sha256 "1fa372776d456feb5a3f501656b3d3f952c10496a120213a38192b3d3bd52062"

    url "https://github.com/phantomptr/ps5upload/releases/download/v#{version}/PS5Upload-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "40084e3037fbe5980400c39579a485ac40d94e0c6ab536d406cc6286689bb279"

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
