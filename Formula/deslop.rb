class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.9.0/deslop-0.9.0-macos-arm64.tar.gz"
      sha256 "06d5a56cc6bca8df49e5b451441db084dcb0290b99756320bfda1ca0388427c0"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.9.0/deslop-0.9.0-macos-x64.tar.gz"
      sha256 "cc52b8c5544fd1819eef655f75d4d5f9f17edc78d928d85e10163e6965b3a20a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.9.0/deslop-0.9.0-linux-arm64.tar.gz"
      sha256 "e1ffd30624da7c270e2f9b8da54bb246e847fc6962b0fd81daa7700da0e57834"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.9.0/deslop-0.9.0-linux-x64.tar.gz"
      sha256 "09958979f883ccdc6b7db3914cfea36d60f73ef16f8b97d59782345b9165ddb3"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/deslop --version")
  end
end
