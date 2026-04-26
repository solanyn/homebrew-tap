class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.608"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.608/scrib-darwin-arm64"
      sha256 "6136d7032f0741c9b8a4b6ab0c02b9669b89604906f9206c6a07e60c1c065d45"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.608/scrib-darwin-amd64"
      sha256 "4a48b8c45d70bcf4eb45d90db2b80c95796c9497051d7753e1985a5aa5115fa4"
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
