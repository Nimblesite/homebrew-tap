class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.1/deslop-0.3.1-macos-arm64.tar.gz"
      sha256 "a9d571bfd2a9ff0223ce93b21b540db2a3f23b1f26ef5615948338c3a903d6fb"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.1/deslop-0.3.1-macos-x64.tar.gz"
      sha256 "30c5475de518396cdd18699a64e66c7ac6e72298ea6604659a0b1f66c10cd0d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.1/deslop-0.3.1-linux-arm64.tar.gz"
      sha256 "0e5033480a181038943a0796aa572c64840bdea7dab28181801fddf12d0cc292"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.3.1/deslop-0.3.1-linux-x64.tar.gz"
      sha256 "488ee5c07cba9c5264d80cebec9a944e8289106382c14ba9ba6add98308168a5"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/deslop --version")
  end
end
