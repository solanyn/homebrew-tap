class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.592"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.1/scrib-darwin-arm64"
      sha256 "21654c1621392b805f7657a03189874df07337393dee2a47096dc48ff968a67d"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.1/scrib-darwin-amd64"
      sha256 "0e698a8d46b73fc9b7a966b99af7b4517edf833c0aa6542e71335b6dc01623f6"
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
