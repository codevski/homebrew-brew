cask "fladder" do
  version "0.10.3"
  sha256 "sha256:567cf48ed983a6d72b7a113b0eb8324f3149268a62aec2da3be96ed55fd777ea"

  url "https://github.com/DonutWare/Fladder/releases/download/v#{version}/Fladder-macOS-#{version}.dmg"
  name "fladder"
  desc "Simple Jellyfin Frontend built on top of Flutter"
  homepage "https://github.com/DonutWare/Fladder"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Fladder.app"

  zap trash: "~/Library/Containers/Fladder"
end
