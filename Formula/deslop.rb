class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.44.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.44.0/deslop-0.44.0-macos-arm64.tar.gz"
      sha256 "4c92b907bb475e30d7be5c388e0db54749ec5631f2596f39cdfc31cb334af7bd"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.44.0/deslop-0.44.0-macos-x64.tar.gz"
      sha256 "81a225fedf00a54a2c18648e508c608f1a4096664fada133e750baee0c2721fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.44.0/deslop-0.44.0-linux-arm64.tar.gz"
      sha256 "8e6a3091745e10a51d1f3ff08ac548372c6e3430b3356a2c64dedd6300e4915a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.44.0/deslop-0.44.0-linux-x64.tar.gz"
      sha256 "63cc81871ad3b021882bc7c746a395e17cd0b42d9bd7b3a313b0e3180173ce7f"
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
    assert_match "0.44.0", shell_output("#{bin}/deslop --version")
  end
end
