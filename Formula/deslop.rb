class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.39.0/deslop-0.39.0-macos-arm64.tar.gz"
      sha256 "d4f3c71f24d8e95a42d1acceb25767728c88379a7750768dcd85426565f138c5"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.39.0/deslop-0.39.0-macos-x64.tar.gz"
      sha256 "ca813fedacd982eb7df717a7a320c3d1a0873383c6970f3b68e185d8562dd16a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.39.0/deslop-0.39.0-linux-arm64.tar.gz"
      sha256 "774b6b8965b802070e9d045f60b54c64026338259515a7337af62a100e0cd5b5"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.39.0/deslop-0.39.0-linux-x64.tar.gz"
      sha256 "5a2cfad61789c6ea0f778e6ede94626fdddee6128ac9d00673fac4d30e308193"
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
    assert_match "0.39.0", shell_output("#{bin}/deslop --version")
  end
end
