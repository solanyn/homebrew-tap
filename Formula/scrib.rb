class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.587"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-arm64"
      sha256 "2a1e27a7d0446da22e54042318929fd2252482f056810399e84e517aaa7a83d1"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-amd64"
      sha256 "e15d1fcd16d50c0933f9ce6326ec39c68cdb8f5d067fee74feeafe2a4534fd62"
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
