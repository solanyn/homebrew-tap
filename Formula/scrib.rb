class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.515"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.515/scrib-darwin-arm64"
      sha256 "6137e41daaeb37e16ac730df5669b9a3376a4fa72e202d549b5df011dfa2af2f"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.515/scrib-darwin-amd64"
      sha256 "15aad5bb651a910ea7d893d22215fa81468436a797aa03d468d2b5531efda4c7"
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
