class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.606"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.606/scrib-darwin-arm64"
      sha256 "aeff53328b5562ed1bca6623ff598c728c806f3eac622be0bf9958b98ebaedfd"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.606/scrib-darwin-amd64"
      sha256 "c4021a5eb023e81965c17c05dc6f9885f8767ab5578a550f915bddf4a074a166"
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
