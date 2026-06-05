class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.1/deslop-0.5.1-macos-arm64.tar.gz"
      sha256 "4a4e02478225242a59295cadf4efcb50c21a2c313a7f08a48cf8a8080c55134a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.1/deslop-0.5.1-macos-x64.tar.gz"
      sha256 "c109dd9cc1185eef3c0497d8144c745b31bd5b086469c8feb0ab1f2cff0e043e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.1/deslop-0.5.1-linux-arm64.tar.gz"
      sha256 "1eff82c334b4be1dfbdb880f5c01d7edb06d99f94692c2a155b6a97fd4117966"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.1/deslop-0.5.1-linux-x64.tar.gz"
      sha256 "a87dc69f8c7e28318bfea349219cf1739f65fcc770a95a6df346f96f4f875228"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/deslop --version")
  end
end
