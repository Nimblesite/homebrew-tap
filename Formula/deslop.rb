class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.7.0/deslop-0.7.0-macos-arm64.tar.gz"
      sha256 "5aebca27168474e26b0aa7eb0abd8034d33e71702ec5941ade47fb7b66453a5a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.7.0/deslop-0.7.0-macos-x64.tar.gz"
      sha256 "84bab76e62f9a311a58a6cb21d1c57d835feaed9986e7b5764abc6a564b10ff4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.7.0/deslop-0.7.0-linux-arm64.tar.gz"
      sha256 "db77bea3d59e15b6b8cfae9ab345adf455826a7e99e2a93bdc04f2db7ed03438"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.7.0/deslop-0.7.0-linux-x64.tar.gz"
      sha256 "92ca230d1f8f5f244074bd8f8685ce5f3cbdbb596779c456aa3f47f88452b6bf"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/deslop --version")
  end
end
