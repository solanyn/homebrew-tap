class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.06.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.06.14/scrib-darwin-arm64"
      sha256 "2b30c0ba5ff28c60ef9900dc355104951d94cd83f44bc76f46cead4cfcb7b4bb"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.06.14/scrib-darwin-amd64"
      sha256 "8edd1473af51fcaf9512524981626fd22ad8843a8277ce36f67e17b97e7cc8d0"
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
