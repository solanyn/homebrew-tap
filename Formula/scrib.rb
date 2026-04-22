class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.598"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.598/scrib-darwin-arm64"
      sha256 "b8d4ad00d48f204ba28f3b549bf0279f14c5ef2f0ed0ed7459632da436be5f0e"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.598/scrib-darwin-amd64"
      sha256 "b8c96f288598ab2892deda9f17f2979a234893700ef439bd61fb22ca9b1695fe"
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
