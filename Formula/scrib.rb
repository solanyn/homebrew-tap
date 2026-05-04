class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.630"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.630/scrib-darwin-arm64"
      sha256 "9519decbb3590e2c0ce3e3f7b6026ee86900cc6f697e2d4beb475a7791b14d68"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.630/scrib-darwin-amd64"
      sha256 "045768ed7db68ba27b94fe5f05b94a780ed5cad5dfe5ed3ed45f4f4cf3dfb4fd"
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
