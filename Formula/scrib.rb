class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.623"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.623/scrib-darwin-arm64"
      sha256 "9b27dc34124bc718a55794cde7dd8d90256d354b66f62f894cd17e3bae09efba"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.623/scrib-darwin-amd64"
      sha256 "62d4d4c23de7aa553ff3d02d44068d143adf9849aaab9949b3bc4609d96ac498"
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
