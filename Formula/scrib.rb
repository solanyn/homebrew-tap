class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.607"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.607/scrib-darwin-arm64"
      sha256 "3dcb51513c63f56b3241e382bbf7001778057dc2da8a070d6b80fe5a61573704"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.607/scrib-darwin-amd64"
      sha256 "db773ad3b1e1ec1882c2add1bd5169242330fda146ffda3e63fbdfe91f1e921d"
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
