class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.8.0/deslop-0.8.0-macos-arm64.tar.gz"
      sha256 "41d9365bf16cab2bec55e745b1b766b7a9e7ef5cef7f10cb2ce3b7b949598771"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.8.0/deslop-0.8.0-macos-x64.tar.gz"
      sha256 "ea8c45d2e6cf1e46aa15015b4e7ddcdaa781ab71d8f5550d50163ce0ce7b6219"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.8.0/deslop-0.8.0-linux-arm64.tar.gz"
      sha256 "4f082dbc4019eb91e5a06eda39aa0b40a36b8f3c0ef18af3cc22cc7bbf183e4d"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.8.0/deslop-0.8.0-linux-x64.tar.gz"
      sha256 "1a1cae2213f82e37944417fe0f80ec8cc1705c5869a066b350ffa449036f975e"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/deslop --version")
  end
end
