class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.600"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.600/scrib-darwin-arm64"
      sha256 "c9a1d79fbf359e45ffe3bef73bc504fb8f79a063f24790f634fb494202fdde66"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.600/scrib-darwin-amd64"
      sha256 "562ec8172d90e947b2baba34335f7e6f0982c96514f58a525dca266f5c0bf9fe"
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
