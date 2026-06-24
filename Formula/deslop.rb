class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.20.0/deslop-0.20.0-macos-arm64.tar.gz"
      sha256 "6b158efda698f7c6888afde2f56d7a31da512bc27561e7847a226aa7d8f54a0e"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.20.0/deslop-0.20.0-macos-x64.tar.gz"
      sha256 "847b75bbe5fdf427a4c6ff245013ca54d3791fa93136ee304f4ab10c401c46a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.20.0/deslop-0.20.0-linux-arm64.tar.gz"
      sha256 "ef8584973f72dd80c71432c07302b5a42301a63d1154282c6015eed8ee39becb"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.20.0/deslop-0.20.0-linux-x64.tar.gz"
      sha256 "88d1fd3e94c42beb27b1ad5043922429d7d1f3862514dc9ef9ba0d1f48ce8553"
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
    assert_match "0.20.0", shell_output("#{bin}/deslop --version")
  end
end
