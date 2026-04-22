class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.04.599"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.599/scrib-darwin-arm64"
      sha256 "1fc044872a3f9043de71a4774b129ac66866609e2f51f014450df960a158e332"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.04.599/scrib-darwin-amd64"
      sha256 "12cdefdf6c9a20e1d2b24aed8506a3934763dc151a95d91681d4ef6880dda140"
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
