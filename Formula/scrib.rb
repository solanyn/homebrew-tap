class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.613"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.613/scrib-darwin-arm64"
      sha256 "4a280613f582dd162e9ee3c40d13f074f62dac8925d81e29927df4692c51fb9d"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.613/scrib-darwin-amd64"
      sha256 "cad2f7d6cf9947cb2f217417bb2f9d8254ac1ba1ec8c0e975101ddd280158bc7"
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
