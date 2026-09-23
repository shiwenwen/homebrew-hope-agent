cask "hope-agent" do
  arch arm: "aarch64", intel: "x64"

  version "0.54.0"
  sha256 arm:   "c38e6011c650c3624420e266f25773e0cd0bfea6b48a60ee8dfb89ea0cc0c67b",
         intel: "2932fa6e2b0bd280a473d74cfd288b1b04a0b27df1f9f6d629e719caf7b17c82"

  url "https://github.com/shiwenwen/hope-agent/releases/download/v#{version}/Hope.Agent_#{version}_#{arch}.dmg"
  name "Hope Agent"
  desc "Local-first AI assistant with cross-device sessions and IM channel routing"
  homepage "https://github.com/shiwenwen/hope-agent"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Hope Agent.app"

  binary "#{appdir}/Hope Agent.app/Contents/MacOS/hope-agent"

  caveats <<~EOS
    The bundle is not yet code-signed or notarized. The installer clears
    the macOS quarantine attribute so first launch should work without
    extra steps, but you may still see a Gatekeeper warning. If macOS
    refuses to open the app, run:

      sudo xattr -cr "/Applications/Hope Agent.app"

    Launch the desktop app from Launchpad/Spotlight, or `open -a "Hope Agent"`.

    The `hope-agent` shell command is also installed for the headless modes:
      hope-agent server start   # HTTP/WS daemon (no GUI)
      hope-agent acp            # ACP stdio for IDE integrations

    Updates are delivered by the app's built-in updater, not by Homebrew.
    After install, `brew upgrade` will not touch this cask — the desktop
    app prompts you when a new release is published, and the `hope-agent`
    CLI shares the same binary so it stays in sync automatically. To force
    a reinstall from this tap (for example to recover from a broken
    install), run:

      brew reinstall --cask hope-agent
  EOS

  postflight do
    # Strip the quarantine xattr so first launch does not trip Gatekeeper
    # for unsigned/un-notarized builds. Safe to ignore failures — if the
    # xattr is already absent xattr returns non-zero.
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Hope Agent.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/ai.hopeagent.desktop",
    "~/Library/Caches/ai.hopeagent.desktop",
    "~/Library/Preferences/ai.hopeagent.desktop.plist",
    "~/Library/Saved Application State/ai.hopeagent.desktop.savedState",
    "~/Library/WebKit/ai.hopeagent.desktop",
    "~/.hope-agent",
  ]
end
