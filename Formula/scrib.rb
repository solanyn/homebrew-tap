class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.615"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.615/scrib-darwin-arm64"
      sha256 "c6d309b5fc6341dfa042bcdbe2c32f509b8f8db7ed0db464b900ba5a1fb33295"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.615/scrib-darwin-amd64"
      sha256 "f4c80bfeeb18044642ceca751db4ec520cbf43ad69373d843c604c54d4bf5a0c"
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
