class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.06.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.06.6/scrib-darwin-arm64"
      sha256 "b1485dac53d54fe2908ab5a22668c6b156c452603e8eb73b444bfcf2697c6b2a"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.06.6/scrib-darwin-amd64"
      sha256 "ff0ea6d3160cc5a253b0beb65466738042999e83b527fc4dada0f2187f179607"
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
