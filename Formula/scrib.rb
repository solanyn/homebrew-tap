class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.591"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.0/scrib-darwin-arm64"
      sha256 "408968a44bf925df21eabe4bc4ed162e2d6a6c79f7474145499fd63af79b7a61"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.0/scrib-darwin-amd64"
      sha256 "65648f2eab5dac497c606e2da73facebaf38a1bbe526bb5ffd15749ef5db5b8e"
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
