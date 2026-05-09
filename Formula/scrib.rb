class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.633"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.633/scrib-darwin-arm64"
      sha256 "4b67819b35620f36558664873e2fc06556ef070ff29bff5963663f56bf0bf1fb"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.633/scrib-darwin-amd64"
      sha256 "390e1c9fc7bc3ad7b0f26423b3c137cdfd782fd7b6475af0f226392931cc1c22"
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
