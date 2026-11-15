cask "ps5upload" do
  version "12.4.23"

  on_arm do
    sha256 "709ba419cfc6d1a5fd79316200a83610a8a56800e6d6dd8c2eee680af6897952"

    url "https://github.com/phantomptr/ps5upload/releases/download/v#{version}/PS5Upload-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "58751990ed7f76f882deccf167ea81bb9a9738ff83b5f464649abe0f7b2ff716"

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
