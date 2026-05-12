class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.643"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.643/scrib-darwin-arm64"
      sha256 "350962e9d4fbec3ad61a8cbdfaf901fadbfd398cc8256416f8ed7ae95a2f9662"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.643/scrib-darwin-amd64"
      sha256 "4a837a8c83ece5c315fd450a6072e2f7bd87a3b474272386520ab1c62557dcae"
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
