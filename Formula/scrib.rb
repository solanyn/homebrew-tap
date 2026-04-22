class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.601"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.601/scrib-darwin-arm64"
      sha256 "e6129964276a914a0187d60c90aa42919871dd85cdf0ee7135e215f3b684156b"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.601/scrib-darwin-amd64"
      sha256 "9374e1163216b359ed498c0932244aaf14b1815ff07877caeb6f908afc9cf782"
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
