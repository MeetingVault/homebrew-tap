cask "meetingvault" do
  version "0.3.9"
  sha256 "2b112e884c7391310f7e68ba5823ff1f295356e155a0677ec821b4a0a87fb920"

  url "https://getmeetingvault.com/releases/MeetingVault-#{version}.dmg"
  name "MeetingVault"
  desc "Meeting recorder with on-device transcription"
  homepage "https://getmeetingvault.com/"

  livecheck do
    url "https://getmeetingvault.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "MeetingVault.app"

  zap trash: [
    "~/Library/Application Support/MeetingVault",
    "~/Library/Caches/com.meetingvault.app",
    "~/Library/HTTPStorages/com.meetingvault.app",
    "~/Library/Preferences/com.meetingvault.app.plist",
    "~/Library/Saved Application State/com.meetingvault.app.savedState",
    "~/Library/WebKit/com.meetingvault.app",
  ]
end
