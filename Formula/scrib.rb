class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.636"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.636/scrib-darwin-arm64"
      sha256 "edc3b54ffb4838ba9b7393b01a3df6f66583e0a1463631c8f8bf72cf005a462a"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.636/scrib-darwin-amd64"
      sha256 "caabc5c2dbbe424b80ee633808cb1c70de1e3c12d975b6aefbdd9baee81929b8"
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
