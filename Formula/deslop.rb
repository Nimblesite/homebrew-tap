class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.23.0/deslop-0.23.0-macos-arm64.tar.gz"
      sha256 "baa37e89e9d725d5d460b5fcfd10b271dd932ce8b121e721c376ca31754ee83a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.23.0/deslop-0.23.0-macos-x64.tar.gz"
      sha256 "609156603a4c856f9faa206ef8257564545cb1b8e1b7eded7516a39bcc1c17a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.23.0/deslop-0.23.0-linux-arm64.tar.gz"
      sha256 "a0ab646991b4c5f3140d3462b4fccf6f4b4196c14dea9b2812ba40a76276c548"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.23.0/deslop-0.23.0-linux-x64.tar.gz"
      sha256 "2095132874e93faffc03da62ab7efc3d0a9d2cac286f0a0d84460e06ce802e16"
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
    assert_match "0.23.0", shell_output("#{bin}/deslop --version")
  end
end
