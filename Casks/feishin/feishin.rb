cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.13.0"

  sha256 arm:   "967d6476ae3a06549798f466a64aeeefc39408dcfe271cb753b4c67d8b384b69",
         intel: "da501d8fe9b0150505f4a6b91b4af4aa2bc4cd619339c4c814d1df7c460244a6"
  url "https://github.com/jeffvli/feishin/releases/download/v#{version}/Feishin-#{version}-mac-#{arch}.dmg",
      verified: "github.com/jeffvli/feishin/"
  name "Feishin"
  desc "Modern self-hosted music player"
  homepage "https://github.com/jeffvli/feishin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "Feishin.app"

  # Remove quarantine as postinstall so user doesn't have to do it automatically
  postflight do
    system_command "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Feishin.app"]
  end

  zap trash: [
    "~/Library/Application Support/feishin",
    "~/Library/Logs/feishin",
    "~/Library/Preferences/org.jeffvli.feishin.plist",
    "~/Library/Saved Application State/org.jeffvli.feishin.savedState",
  ]
end
