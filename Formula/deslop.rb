class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.33.0/deslop-0.33.0-macos-arm64.tar.gz"
      sha256 "1e2b87301dd22c5ac39ef12b352dc0207a483c2bde1a2487a51e1885276fc1e7"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.33.0/deslop-0.33.0-macos-x64.tar.gz"
      sha256 "add78089b420cb94bc77bac78c39543c90e510e1da0a88ef637c92fc1f3b45da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.33.0/deslop-0.33.0-linux-arm64.tar.gz"
      sha256 "ded7de2955efeac73bd360fb5790aefaee44c2ed2b7cdafd0877a2816a634939"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.33.0/deslop-0.33.0-linux-x64.tar.gz"
      sha256 "f6d60f99834cbeee6eb2263ba9eaeb68ef8fe428984b3d6d61bfdaaed0794c26"
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
    assert_match "0.33.0", shell_output("#{bin}/deslop --version")
  end
end
