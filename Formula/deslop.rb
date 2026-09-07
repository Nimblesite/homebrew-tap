class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-macos-arm64.tar.gz"
      sha256 "8053dab834112242f57ea7a31aa94febe5e4da6c4ade4824d2a1dc4da5b213f0"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-macos-x64.tar.gz"
      sha256 "b8e83df252b5b49e75d9d4dee1f8d6df804c1b6bef3bfaf97dce3960df71b592"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-linux-arm64.tar.gz"
      sha256 "ba9739cbf594bcfe4d7748736c6da058ee68b52faa0dcf5ded8c35702ef33b1a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-linux-x64.tar.gz"
      sha256 "05c86a283bc98fb9163afe62a57bbd24883dcaf1eb07c69919a99fb6b9d1d562"
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
    assert_match "0.34.0", shell_output("#{bin}/deslop --version")
  end
end
