class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.25.0/deslop-0.25.0-macos-arm64.tar.gz"
      sha256 "25b192e62d40c76b5b0124666dda0ed95db9e960db4efa847dc585bdfe52177d"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.25.0/deslop-0.25.0-macos-x64.tar.gz"
      sha256 "661e6984f6d4a5bf25e817a2ddbdf5d2173b74f333a513bca848a004d1ae2b1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.25.0/deslop-0.25.0-linux-arm64.tar.gz"
      sha256 "c683d9b785551727aa4b5759c84adc4988e45286b1f0ea3ac14c043c4f4a6117"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.25.0/deslop-0.25.0-linux-x64.tar.gz"
      sha256 "a6a4b58f547dd371407fee0e42b9d21b1a5aeaed391d1390c26b1457a4b28710"
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
    assert_match "0.25.0", shell_output("#{bin}/deslop --version")
  end
end
