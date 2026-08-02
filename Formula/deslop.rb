class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.30.0/deslop-0.30.0-macos-arm64.tar.gz"
      sha256 "6a215b5916046d0b853f2f0deb6950b360aa3413f828fac7957da38d2d1603ae"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.30.0/deslop-0.30.0-macos-x64.tar.gz"
      sha256 "3127c0cafd983b7b185646ec205e08f5f4b330795727514414a541e1c6862300"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.30.0/deslop-0.30.0-linux-arm64.tar.gz"
      sha256 "caa66711aaa32e43af5c2f272ad11eac9d5704c70a6f327dda2572f79925e759"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.30.0/deslop-0.30.0-linux-x64.tar.gz"
      sha256 "b5b310eb31613c779326560cf5ba0c7da62d977839743890d00df9b18cb8130b"
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
    assert_match "0.30.0", shell_output("#{bin}/deslop --version")
  end
end
