class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.28.0/deslop-0.28.0-macos-arm64.tar.gz"
      sha256 "d710252cd8b9cae164dc9049f13e60e696bdb2273338410b4035997451b9a334"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.28.0/deslop-0.28.0-macos-x64.tar.gz"
      sha256 "9dfde3ec4bd8769a5ed946f9a2f55261ebb6382d9c76021ac0d117d7fe72824e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.28.0/deslop-0.28.0-linux-arm64.tar.gz"
      sha256 "79e0d4edf62d6ae34109d90b217d89c1161c6525babbb4340e6fece2bd10d7fb"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.28.0/deslop-0.28.0-linux-x64.tar.gz"
      sha256 "3fd27e47d176cdb0124688b47b977fd166e52e392c15eb7fdae06dfe2563d7d1"
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
    assert_match "0.28.0", shell_output("#{bin}/deslop --version")
  end
end
