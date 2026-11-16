class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.43.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.43.0/deslop-0.43.0-macos-arm64.tar.gz"
      sha256 "0ce71f2cf97549d2991164a64196ddc22088f71aef677137f54d8eb4a3397efe"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.43.0/deslop-0.43.0-macos-x64.tar.gz"
      sha256 "e6b65985e06c35f85230e3e8b2277d069695d2004b4bea0b319709a78c9456ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.43.0/deslop-0.43.0-linux-arm64.tar.gz"
      sha256 "bf1bc61c3ea63fde3fde5f39a5ddc5c8bf321c11f6a1a65c5f031d37ee75d694"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.43.0/deslop-0.43.0-linux-x64.tar.gz"
      sha256 "40abc1d1ea33ae2f36d383cfd17036ec1d5fb2126eeaa6aa31ec8343eed25ec4"
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
    assert_match "0.43.0", shell_output("#{bin}/deslop --version")
  end
end
