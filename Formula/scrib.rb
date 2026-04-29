class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.616"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.616/scrib-darwin-arm64"
      sha256 "3e034a7f470d236a420c51b25e5b73273ad9f15200caea3e8e815d6e618f70c3"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.616/scrib-darwin-amd64"
      sha256 "d184bd55a430f79379d2c609f1e7f9d6284f053ecf758753e99c2c65bdb05eb8"
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
