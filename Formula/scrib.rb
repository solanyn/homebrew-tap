class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.592"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.1/scrib-darwin-arm64"
      sha256 "84e0e730fbdc495aff5a1c9adffedb51fd3e5971fcb2ba0fcf2122235723ee16"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.1/scrib-darwin-amd64"
      sha256 "65f6e56c6d1b3fc36f898063e1b2e503e89335758b46128ec3a9aec6e49637ed"
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
