class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.631"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.631/scrib-darwin-arm64"
      sha256 "8d075e920fcf555eb5a289b203ed6a37d7fdb70b48cca59726d2dc338a803c38"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.631/scrib-darwin-amd64"
      sha256 "f7019fb0621258138217924f48ca87aad7a4519e413d2e1d50333158f7f1a730"
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
