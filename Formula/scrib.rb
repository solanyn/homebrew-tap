class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.593"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.593/scrib-darwin-arm64"
      sha256 "c380aeb6a289d5ee8f8810938c91112dcc2a4bcd22ad4acae05bd0ef2624530d"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.593/scrib-darwin-amd64"
      sha256 "334de4cac7bbf8b06cd843aabaea2318f7b3ea5019d92081f0a49b5c5d2a7007"
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
