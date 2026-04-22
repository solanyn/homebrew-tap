class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.595"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.595/scrib-darwin-arm64"
      sha256 "721962a803b54916e767b4a867220207ceb3d06edd402eae89e9ec01a69fe207"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.595/scrib-darwin-amd64"
      sha256 "ff97ee671b000f3f2872b84c2551ea12c92b2da3e12dc519e3cec58424efbb1b"
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
