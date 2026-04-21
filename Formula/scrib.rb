class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.588"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-arm64"
      sha256 "17822921cf07448b3b4dbdcd446f3281bf0c5684aaa7e8a843fc16c4b7c1cb99"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-amd64"
      sha256 "a6ffb5ef18df51a30c5bb13c78afaa60effbbe174fe406cd321080afaf3e3414"
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
