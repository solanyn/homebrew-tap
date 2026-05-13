class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.64"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.64/scrib-darwin-arm64"
      sha256 "98353be96429f59f7f4d4e8bfec7be3068dc7374d1e4278e276a66450ed1a07f"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.64/scrib-darwin-amd64"
      sha256 "8f6c5a5c1c4089ed7be5a36b48597c48d9deba14373bd8f715c7274cf81d31d4"
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
