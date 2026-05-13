class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.61"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.61/scrib-darwin-arm64"
      sha256 "b1a2e91f27d14120a817d40f5ff235f77545f5fdda5b9e8e1ebea87ece535e8f"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.61/scrib-darwin-amd64"
      sha256 "7e5f3496b1d1c9f5f8a8d422a714277f0be83abab933575c2481ac5b38839a26"
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
