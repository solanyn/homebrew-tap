class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.627"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.627/scrib-darwin-arm64"
      sha256 "d81e9eb9fc2d771e4ae81455591ea1c433a9c82759ce539b7049cb6160213083"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.627/scrib-darwin-amd64"
      sha256 "8122b9749fde7fe231315053f3fd8fd9ed235b0cf78b8bb7fdf699a8c4323cd0"
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
