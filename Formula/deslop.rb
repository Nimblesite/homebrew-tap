class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.46.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.46.0/deslop-0.46.0-macos-arm64.tar.gz"
      sha256 "9535a7a529d3f9112a18d3938c37baf1048ef9039423c709da0d4d4a384547cc"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.46.0/deslop-0.46.0-macos-x64.tar.gz"
      sha256 "5983254e48d91f17efa152b4744b1e5c065a26e2b16dee98a9204d9bae5de532"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.46.0/deslop-0.46.0-linux-arm64.tar.gz"
      sha256 "cc217dd499b2b0304c9153ab2fd7f142ab47c15e09f77738d082d19909986270"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.46.0/deslop-0.46.0-linux-x64.tar.gz"
      sha256 "ee8da5e2d0a8ab586cf71a5a2f05f9a8c2a2aacde196aee76b5a9c92631d31ee"
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
    assert_match "0.46.0", shell_output("#{bin}/deslop --version")
  end
end
