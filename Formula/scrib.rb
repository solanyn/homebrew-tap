class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.609"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.609/scrib-darwin-arm64"
      sha256 "530c8668c8b2f4a852128d175ae91e9a44fb4ac00d10ac789be9304ffcc96453"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.609/scrib-darwin-amd64"
      sha256 "c17f1568cef8909051902e02730c94526a3e4bf26855ab6df9e8a99e09ebefdb"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "scrib-darwin-arm64" => "scrib"
    else
      bin.install "scrib-darwin-amd64" => "scrib"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scrib --version 2>&1", 1)
  end
end
