class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.06.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.06.15/scrib-darwin-arm64"
      sha256 "85a1c8e56e282315718bd21451918f5f673dc7a6c4a162a0231984d2618e9454"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.06.15/scrib-darwin-amd64"
      sha256 "65db31867a2d32aa20420bf3f43f25675a33b3075ac0e102a152138f1f0686c4"
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
