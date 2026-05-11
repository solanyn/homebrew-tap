class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.635"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.635/scrib-darwin-arm64"
      sha256 "f0d05aee49b9bab59482dec81ff844b86f9cc0a70d45a043daf70010c1b275d7"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.635/scrib-darwin-amd64"
      sha256 "976dbccca9476130348cf27d975b1c869e0275df17c53a035974d73d63944061"
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
