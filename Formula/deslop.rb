class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.29.0/deslop-0.29.0-macos-arm64.tar.gz"
      sha256 "7a0bcec2efeb20d79283ce92fd8c580da53dcc26b1c1ad7227d7d289c384b5d0"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.29.0/deslop-0.29.0-macos-x64.tar.gz"
      sha256 "922c42a4f7a42e444260d9f0d501c926e2d30662c1e72728540cbd5bd1702f5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.29.0/deslop-0.29.0-linux-arm64.tar.gz"
      sha256 "a528445533694e3e094c3242f9b139f4f35383bddcd18a4dd671659647ae8035"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.29.0/deslop-0.29.0-linux-x64.tar.gz"
      sha256 "2228c516655e39ac4cf6bfd1298aaa38cb5997710d106e9bd2209dd4adfc7cff"
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
    assert_match "0.29.0", shell_output("#{bin}/deslop --version")
  end
end
