class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.625"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.625/scrib-darwin-arm64"
      sha256 "8dec73e95fcec8be810debce0f068de9417030b41e8a9545f40e87c504538f86"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.625/scrib-darwin-amd64"
      sha256 "fbe84b4185b4ad690fc1e8d7220761be44b550ac38bc04493a77c71be3e80679"
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
