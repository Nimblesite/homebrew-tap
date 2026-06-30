class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.22.0/deslop-0.22.0-macos-arm64.tar.gz"
      sha256 "c2a4acda4c625e2920cd3b212c903b7ed72b896ce256c06b5203196d56e8cbf2"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.22.0/deslop-0.22.0-macos-x64.tar.gz"
      sha256 "65cf1c26809c31412a6cb69e8bae19dcd2cae4389845621b9178e29da229d029"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.22.0/deslop-0.22.0-linux-arm64.tar.gz"
      sha256 "fa8428a922b936a54e0b4135ec6373090dd2c75a2f60f71e8f70eb1f86cb8060"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.22.0/deslop-0.22.0-linux-x64.tar.gz"
      sha256 "7bbcebf77345f504bb1dcbfa98d28657a8476d64e7abb8ca6dc0bcd39b44547d"
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
    assert_match "0.22.0", shell_output("#{bin}/deslop --version")
  end
end
