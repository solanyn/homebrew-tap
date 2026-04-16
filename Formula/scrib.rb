class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.1.0/scrib-darwin-arm64"
      sha256 "6259f53a0015291f631af12c21893723669cbfade584e5c5eaa4d3a50466bef5"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.1.0/scrib-darwin-amd64"
      sha256 "706981ce041b16ca1a2a699268c70aac4c582dd46b848dfb617f1935b8cf820c"
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
