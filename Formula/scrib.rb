class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.614"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.614/scrib-darwin-arm64"
      sha256 "4bf7628d86b9496680814aa45839e4c590d7b8bb312834952533fd93a8cdb91d"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.614/scrib-darwin-amd64"
      sha256 "12c890d52dba7793518da2124a733ae6d804e844341943fc8c634c62aa72cb58"
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
