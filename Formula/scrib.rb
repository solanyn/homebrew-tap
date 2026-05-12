class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.647"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.647/scrib-darwin-arm64"
      sha256 "23575e58284471aec5fff7fe476069e53ecf67d62eae46a85f68285a9a8a3db3"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.647/scrib-darwin-amd64"
      sha256 "0b42c9621ba6874dcb9bdd885bfaa1ec11f397aa1db7088985413328adc0390e"
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
