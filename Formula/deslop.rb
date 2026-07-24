class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.26.0/deslop-0.26.0-macos-arm64.tar.gz"
      sha256 "8e3d91968072064b9db9ec2f72a63405e09e4a4c74c2ac9d4c30c05fcab3704c"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.26.0/deslop-0.26.0-macos-x64.tar.gz"
      sha256 "8c0616929336b4bc205f8f412a62aafdb25592fc5027c9c5cf7a93858e951316"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.26.0/deslop-0.26.0-linux-arm64.tar.gz"
      sha256 "67cdd05e6ddf0741d3979a2c615389b7c971352e9259916c8002ad6d8a366112"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.26.0/deslop-0.26.0-linux-x64.tar.gz"
      sha256 "04a89f73b9d4bf13081b1755308fc18a84607b78b099b6aa9687ac6aeb621bd5"
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
    assert_match "0.26.0", shell_output("#{bin}/deslop --version")
  end
end
