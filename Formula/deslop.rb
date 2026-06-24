class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.21.0/deslop-0.21.0-macos-arm64.tar.gz"
      sha256 "02dbbdb9a14bb8d865e79ae87cb3375160ff2f074ce3fad28994dcd18ecfff85"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.21.0/deslop-0.21.0-macos-x64.tar.gz"
      sha256 "66d0c52cf73afba09cfd28bac0e8633724d58fa0b3a6e84b54f1f86096406be8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.21.0/deslop-0.21.0-linux-arm64.tar.gz"
      sha256 "88117eee78c4c0059fa221e60de1c62224e6fec02155a17bec1abac91e689f29"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.21.0/deslop-0.21.0-linux-x64.tar.gz"
      sha256 "8d6492eb04791bb6595733379c9e77068b42c74995100b274c73c5f1a58ae196"
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
    assert_match "0.21.0", shell_output("#{bin}/deslop --version")
  end
end
