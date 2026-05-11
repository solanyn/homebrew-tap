class Scrib < Formula
  desc "Voice-to-text transcription tool with local and remote modes"
  homepage "https://github.com/solanyn/mono/tree/main/scrib"
  version "2026.05.642"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.642/scrib-darwin-arm64"
      sha256 "aa812e1ec51da78af113057076fede84d51fd1e639aaf848e26a2bdd81a96bdd"
    end
    on_intel do
      url "https://github.com/solanyn/mono/releases/download/v2026.05.642/scrib-darwin-amd64"
      sha256 "542fc97ce7ca43861281ef7be63642f86d8113730be0d420ac86ca8e47788cd5"
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
