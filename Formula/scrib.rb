class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.621"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.621/scrib-darwin-arm64"
      sha256 "4e2e8e3b44b3e4d2572bea9f16517945c35db1cac276fec73dd32329212ad27d"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.621/scrib-darwin-amd64"
      sha256 "223fe1e357dd2a59ef2930348ff332ddebeb78154bb95887e9d13d3e2421f8d5"
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
