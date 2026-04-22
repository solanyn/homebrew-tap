class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.603"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.603/scrib-darwin-arm64"
      sha256 "d2c19cf900d37e00ff4792a681593e3884531de90734ba48b3ca68405a671194"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.603/scrib-darwin-amd64"
      sha256 "b567a78afc0c7212170c1a6488b810bb13e1eca01a89e0567f66db78094036da"
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
