class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.589"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-arm64"
      sha256 "3c47470761d7bfba4cdcf6bd1c04ca19d42a20cccee35ea5e0360a609d06b6f4"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-amd64"
      sha256 "f4f880928ad413f11bad2d37a4d7a29efa20853041d743a75980fa13ecdefaa2"
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
