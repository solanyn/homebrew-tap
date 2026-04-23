class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.604"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.604/scrib-darwin-arm64"
      sha256 "3f947634bcbf0ecdde2787690ba6564e823d97ad45c3483b0a1cd0a133a94936"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.604/scrib-darwin-amd64"
      sha256 "0c3f21cbe653ca9572168a7922c9245fb56c53c9a41362ddd5406fe9fd26dfc2"
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
