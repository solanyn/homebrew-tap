class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.65"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.65/scrib-darwin-arm64"
      sha256 "ea3d57f79e93e3d237df5ecaa9152e7b908cc55baad093781cb2d3f1b0c3f049"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.65/scrib-darwin-amd64"
      sha256 "c44ee4d84ebd4b495f3e93ce6c482bfab252783eb19313b47c8c522b78106328"
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
