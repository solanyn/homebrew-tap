class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.602"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.602/scrib-darwin-arm64"
      sha256 "d740f6a76e8000c68e73242dbc5841fc279d4f6c3a40c84bc4632fcdfcf615ce"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.602/scrib-darwin-amd64"
      sha256 "694d9a08382c029a1f0f053ff4531f0ebbdde73c0c42f2e259a91e5c15eb2a1f"
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
