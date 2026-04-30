class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.624"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.624/scrib-darwin-arm64"
      sha256 "6234cefe088180944a1aafbc63f7d2c92a2f4c30935e262ba1b12a173117ea71"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.624/scrib-darwin-amd64"
      sha256 "c4427f7ad4578d874ca26302bbe91e57e7a5e3b29dc2e94afc472b398f9664c2"
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
