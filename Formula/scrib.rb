class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.632"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.632/scrib-darwin-arm64"
      sha256 "f170e5243dff49ecc81382ac97121d244fba972bf02938d31e33ae9d4a409716"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.632/scrib-darwin-amd64"
      sha256 "212a00ea429e7ef815c3910a467402b1ce2ca0a04cbdcdc33fd08af2345900a9"
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
