class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.634"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.634/scrib-darwin-arm64"
      sha256 "49707f23a70d3a40824ce242407a6d5c82de9547efcb511b93e1713eba0a5940"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.634/scrib-darwin-amd64"
      sha256 "c178446c689e08b19ccef063cceb0048a60793de2bf0797c825541695923d235"
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
