class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.591"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.0/scrib-darwin-arm64"
      sha256 "cb407956d2b4cd26ee775be14aa441d35dcbcf6f98057a49d2dc447a2e33cee4"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.0/scrib-darwin-amd64"
      sha256 "cfe9299322155bd62e24f1d40a9e73545b28ddd35a956d869eab5d1621e1a217"
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
