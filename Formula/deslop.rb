class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.38.0/deslop-0.38.0-macos-arm64.tar.gz"
      sha256 "e98adf7b9612607b61fb6415578906739ec5f13a753d788bdbe9bb7d52e6a703"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.38.0/deslop-0.38.0-macos-x64.tar.gz"
      sha256 "4878f6d4304a6de2132071de4e20d71e36be7fe05c53aab27e93a67c475574e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.38.0/deslop-0.38.0-linux-arm64.tar.gz"
      sha256 "2e686f29845cba49f32475258d0a209cac24395be72213133d15c450ac6974a9"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.38.0/deslop-0.38.0-linux-x64.tar.gz"
      sha256 "235d718e9da7c5e3da47ae7770d30946a5c512ba0493ed51c1ee632493538637"
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
    assert_match "0.38.0", shell_output("#{bin}/deslop --version")
  end
end
