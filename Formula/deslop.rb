class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.31.0/deslop-0.31.0-macos-arm64.tar.gz"
      sha256 "2195add181ecd494b3cfc41bd6df0d44c740a49b9e9f2512478bd9dfda701da6"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.31.0/deslop-0.31.0-macos-x64.tar.gz"
      sha256 "1d83a2c45aa833807c2206e80ae46d4528f7acd31ffe4bc829415611991c6264"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.31.0/deslop-0.31.0-linux-arm64.tar.gz"
      sha256 "284c905770e841df42a85f94b4d15c9b29eac6611f2f8ca5e1844c62b5ffda26"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.31.0/deslop-0.31.0-linux-x64.tar.gz"
      sha256 "406e61b37fe8d50dbc59b8e4723fa39473a65db87578e6f3426e1223228e916c"
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
    assert_match "0.31.0", shell_output("#{bin}/deslop --version")
  end
end
