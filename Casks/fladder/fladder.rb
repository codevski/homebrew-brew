cask "fladder" do
  version "0.12.0"
  sha256 "983a411c9e9e961d9c97dee9f432e01145492b8b604d2c3bacfbf5277eb0cdc9"

  url "https://github.com/DonutWare/Fladder/releases/download/v#{version}/Fladder-macOS-#{version}.dmg"
  name "fladder"
  desc "Simple Jellyfin Frontend built on top of Flutter"
  homepage "https://github.com/DonutWare/Fladder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Fladder.app"

  zap trash: "~/Library/Containers/Fladder"
end
