class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.644"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.644/scrib-darwin-arm64"
      sha256 "1b046776d299ce2143be0b96d6c99a767ab87a9872d6f6a59aba3e489a0cd5d9"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.644/scrib-darwin-amd64"
      sha256 "2fa3717c60dc59c50d4ea8e17ba4c6d0207f99cacf8183fc8f36e03eaa3506c0"
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
