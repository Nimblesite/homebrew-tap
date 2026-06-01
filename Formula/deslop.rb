class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.0/deslop-0.3.0-macos-arm64.tar.gz"
      sha256 "3c94f3dedb6b8ef357d0707c5e3c38023557632618c2170a09ecd034c856c359"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.0/deslop-0.3.0-macos-x64.tar.gz"
      sha256 "383d0707087c46869c8e03b956959f8d53acf02b826c8a3baf72656876505d61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.0/deslop-0.3.0-linux-arm64.tar.gz"
      sha256 "f9f6ebb14ab16484771542da1db7a745504af582133f03399f84554700304e2a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.0/deslop-0.3.0-linux-x64.tar.gz"
      sha256 "81e0fc7e245d2a49bb9e01400a2636888e0e9e829e182dd630c22f5b82825693"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/deslop --version")
  end
end
