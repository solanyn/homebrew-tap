class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.593"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.2/scrib-darwin-arm64"
      sha256 "c0245a44075ad789ea41ac37415bd6517f35968e472b36560d6578a004bdf183"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.3.2/scrib-darwin-amd64"
      sha256 "ad2a376b23256354e8b54f984a1b9bb5e299b653853a364cb0ac16105237bf40"
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
