class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.597"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.597/scrib-darwin-arm64"
      sha256 "054c97f9ca7be33fb39cd4928e6ce39e746b26b5c18a86a7559da03289a03848"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.597/scrib-darwin-amd64"
      sha256 "97a26e4fd50785813eebeceab527a25ba92b9b43c7b69caa88f38da138b6b9ea"
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
