class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.622"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.622/scrib-darwin-arm64"
      sha256 "1c9e227c23178c0e30868c8d7642b654618d495f3b897e5cdd12c4303feb5e8c"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.622/scrib-darwin-amd64"
      sha256 "1411fa165ef783fb9799da8a81134d22f7725942af8dc3edeff27eadd4810cf0"
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
