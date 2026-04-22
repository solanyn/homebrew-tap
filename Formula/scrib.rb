class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.594"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.594/scrib-darwin-arm64"
      sha256 "8b4e97a52370bf5009a8cb907ddd52a7907ae5f83b0bb7f84fa272071c532f82"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.594/scrib-darwin-amd64"
      sha256 "e47f3ba749d2474fa012fddd79b2f8ae23a554fc8e027ba9b4cdd1df00d1fac1"
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
