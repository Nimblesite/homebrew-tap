class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.24.0/deslop-0.24.0-macos-arm64.tar.gz"
      sha256 "72bb4551619df7db338f11a4e82cdc59b3de035e25783f7c591b3b1e3c18c57d"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.24.0/deslop-0.24.0-macos-x64.tar.gz"
      sha256 "ac9f3da38e9174b9b5644f25b5d7908a9fa9ff08d327746e0c51fdf1e66f9bb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.24.0/deslop-0.24.0-linux-arm64.tar.gz"
      sha256 "065be64ebbae11f071ba741459330db308bfaf94c63adaefb93d8dd0b505a19e"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.24.0/deslop-0.24.0-linux-x64.tar.gz"
      sha256 "b8ab85e488470cb6892d0b52dc3ce23cdbec586edb5540702a6d5a18b7916bb5"
    end
  end

  # Install all three binaries unconditionally. The release tarball
  # always contains them (the packaging step copies deslop, deslop-lsp,
  # and deslop-mcp, and verify-deployment-binaries.mjs gates the build
  # on their presence). A bare  fails loudly if a binary
  # is ever missing — a silent  guard previously let a
  # stale tarball install only , leaving deslop-mcp off PATH
  # (issue #240).
  def install
    bin.install "deslop"
    bin.install "deslop-lsp"
    bin.install "deslop-mcp"
  end

  test do
    assert_match "0.24.0", shell_output("#{bin}/deslop --version")
  end
end
