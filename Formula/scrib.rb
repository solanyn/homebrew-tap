class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.646"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.646/scrib-darwin-arm64"
      sha256 "e96992148e3e9a6514d11e2015179df627c10a9585972d45a4b93dabed9d9837"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.646/scrib-darwin-amd64"
      sha256 "ad4bf1db0b6f7aa18a196f7cfd85939f29dae1c7fdb86c97d74e85b8ce1893b9"
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
