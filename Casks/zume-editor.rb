cask "zume-editor" do
  version "0.30.0"
  sha256 "3c9d658f8934f2d1aa34db89a7946bbeb20a5e603d1eb83478553073b5f09261"

  url "https://github.com/zume-editor-dev/zume-editor-releases/releases/download/v#{version}/zume-editor-#{version}-macos-arm64.dmg",
      verified: "github.com/zume-editor-dev/zume-editor-releases/"
  name "Zume Editor"
  desc "Fast native text, code and hex editor with large-file support"
  homepage "https://smolt-stage.com/home/en/zume-editor.html"

  # arm64 (Apple Silicon) build only, for now.
  depends_on arch: :arm64

  # NOTE: confirm the exact .app bundle name inside the DMG before publishing.
  # Mount and check:  hdiutil attach <dmg> ; ls /Volumes/*  ; hdiutil detach ...
  # The CMake target is "zume-editor", so the bundle is expected to be
  # "zume-editor.app". If it is "Zume Editor.app", change the line below.
  app "zume-editor.app"

  zap trash: [
    "~/Library/Application Support/ZumeEditor",
    "~/Library/Preferences/com.zumeeditor.editor.plist",
    "~/Library/Saved Application State/com.zumeeditor.editor.savedState",
  ]
end
