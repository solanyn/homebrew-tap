class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.611"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.611/scrib-darwin-arm64"
      sha256 "e2ed19c202d00ef89af437339b5932393f4c166dd20d80d78cf11708d096e4dd"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.611/scrib-darwin-amd64"
      sha256 "99f86549f95969ceb58f824d905e2085b0e77b991cce6144b866983b35676c41"
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
