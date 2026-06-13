class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.10.0/deslop-0.10.0-macos-arm64.tar.gz"
      sha256 "b583e29ff2f84432bfdd2fa140bd7c391656f1a3beab1b2d6e9bc6f3b62c0e86"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.10.0/deslop-0.10.0-macos-x64.tar.gz"
      sha256 "b42b8b41b5367afc954a38a22aef23134cba63c21263d3223eaf2ec75b561d4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.10.0/deslop-0.10.0-linux-arm64.tar.gz"
      sha256 "6491e5459714d84053b6003017a2a0cd1ebf9754571cb910ab333b5a82011ff8"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.10.0/deslop-0.10.0-linux-x64.tar.gz"
      sha256 "b632952f3ac1b56bc0f18ac967b7f05af219d8181cb8e911aed7843e370ef87f"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/deslop --version")
  end
end
