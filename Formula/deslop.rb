class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.19.0/deslop-0.19.0-macos-arm64.tar.gz"
      sha256 "9c7ecdfbc6bdb224599cf95e7029db4e1e28ffbb1cb68312bcb1fa7ca5a60294"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.19.0/deslop-0.19.0-macos-x64.tar.gz"
      sha256 "e01ff8ed4b29c48a6d5eb125e5e7d016405514fa370cd6450096c9bacfffaab5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.19.0/deslop-0.19.0-linux-arm64.tar.gz"
      sha256 "5b5decaa46c4aeca9662cd1df9fa4478713c7f531eae3bb30623d9b343ddd5b2"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.19.0/deslop-0.19.0-linux-x64.tar.gz"
      sha256 "237bee021bdb8e605b8b14d24592aa1657fe27f1232cdf73577e9d27953943df"
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
    assert_match "0.19.0", shell_output("#{bin}/deslop --version")
  end
end
