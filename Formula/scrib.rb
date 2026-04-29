class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.618"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.618/scrib-darwin-arm64"
      sha256 "b03a20e48af0e5bea490da22fb72c70ea6d8827e5f38796541863e5e30fe7a72"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.618/scrib-darwin-amd64"
      sha256 "7cfa550b1e6bcbd122e1d22f9e067b44a69d5d346a5c3905ef899ffe698c6b08"
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
