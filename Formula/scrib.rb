class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.596"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.596/scrib-darwin-arm64"
      sha256 "0175eb8c50d09f6083b7653f0bb1f22a8ea1be6559fde6141869e6c80876311c"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.596/scrib-darwin-amd64"
      sha256 "c76c3f2d99bddec6594c81d146a3146f52cb3a6210db920ba497742561c55ee4"
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
