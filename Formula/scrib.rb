class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-arm64"
      sha256 "4f6921f75015e40a01ab20da78540be8786f6781b146810a0baa408b1db748eb"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/scrib/v0.2.0/scrib-darwin-amd64"
      sha256 "49c525b33280f3ab7774962d926a34c75ff9b954d224d8fffe5b98b67121f244"
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
