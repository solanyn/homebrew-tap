class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.581"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-arm64"
      sha256 "1248502451dbfb9fedac55a3dd63b98a07fe215b958ca2b262ba6448f6e10199"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-amd64"
      sha256 "85a1dddfbd75c7e543512122f621075745b391035ee8a2bc1a59171d919516c8"
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
