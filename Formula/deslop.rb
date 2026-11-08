class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.41.0/deslop-0.41.0-macos-arm64.tar.gz"
      sha256 "72e0f07450e0c3ddc22155978e8b7fe751227cbcebbb8e5fe8f658dd32c2f76a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.41.0/deslop-0.41.0-macos-x64.tar.gz"
      sha256 "afa3ecf9cbfcf689fb3e3ff34120c7252447d4e888d3bd402e01ee86d7cf9eb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.41.0/deslop-0.41.0-linux-arm64.tar.gz"
      sha256 "0bdfd534dbbca88721c546053da5cb44125407c9a09387ba6f89db6e0813e683"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.41.0/deslop-0.41.0-linux-x64.tar.gz"
      sha256 "f1ec82cb192c91b41ae621df0b278e8ba0eb849904144990c3aa39cb82e5accf"
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
    assert_match "0.41.0", shell_output("#{bin}/deslop --version")
  end
end
