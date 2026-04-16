class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.517"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.517/scrib-darwin-arm64"
      sha256 "df6052764c7f894a7aa163f510434ae67dbb1ca7c1ec2a7245ad27802fb869ee"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.517/scrib-darwin-amd64"
      sha256 "d66b8b699cbc3fe3b6787324f41b738240f126bb1b46e63d241f2bc5be70ffec"
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
