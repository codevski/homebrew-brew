cask "fladder" do
  version "0.11.1"
  sha256 "db7f93e833a14afabb71032a0664c831c567128d5b60c6accc402775065efe51"

  url "https://github.com/DonutWare/Fladder/releases/download/v#{version}/Fladder-macOS-#{version}.dmg"
  name "fladder"
  desc "Simple Jellyfin Frontend built on top of Flutter"
  homepage "https://github.com/DonutWare/Fladder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Fladder.app"

  zap trash: "~/Library/Containers/Fladder"
end
