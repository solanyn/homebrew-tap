class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.626"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.626/scrib-darwin-arm64"
      sha256 "9045b6cce9f238ecd97da7375d8e74b969d78738c5717eb6d82d10ef8530c0b2"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.626/scrib-darwin-amd64"
      sha256 "2eeeab31af1c6c63010b4bc65b46a96949d74fd68b0bb9a2b993e4c6d1c851c7"
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
