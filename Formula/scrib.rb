class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.516"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.516/scrib-darwin-arm64"
      sha256 "104899af8e1c10b925e5080554efd8a56fadee010acf6959c864be87414a6fa9"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.516/scrib-darwin-amd64"
      sha256 "2afb66d64fba911a79bec3b9bec38bb78cba19c4f54d5109852b8e4250864a47"
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
