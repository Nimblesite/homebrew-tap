class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.42.0/deslop-0.42.0-macos-arm64.tar.gz"
      sha256 "cb44cea7ca423e8b517b61650cb1e2d86b68dd8b0fa235049e6ddf7ec2be856a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.42.0/deslop-0.42.0-macos-x64.tar.gz"
      sha256 "f8d874ae7f1733c4cdbeac2da2ce38042c232302f66ab513a715d2945ad76103"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.42.0/deslop-0.42.0-linux-arm64.tar.gz"
      sha256 "8c9ac54caf4b328ceedf101a6a841abe53572642ec019acd3bdcb28ac4c93cc7"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.42.0/deslop-0.42.0-linux-x64.tar.gz"
      sha256 "a06b7f63bfe65e3904e4344f8082a3b9f5ad0dffebd9c23654547d1bbf620364"
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
    assert_match "0.42.0", shell_output("#{bin}/deslop --version")
  end
end
