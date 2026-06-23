class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.18.0/deslop-0.18.0-macos-arm64.tar.gz"
      sha256 "260ae9bc912b515c6e54477694441fa73c470e08d13b98398beaace80ccccd58"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.18.0/deslop-0.18.0-macos-x64.tar.gz"
      sha256 "2ea8845559b6522eaeb79bf73234ee6b005f78d86c3dc46b7bae94403b5e448a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.18.0/deslop-0.18.0-linux-arm64.tar.gz"
      sha256 "90577a9bc731d3cc55ef2b6532d6fd8f0187d59b553af8bf8742e8ba5e834148"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.18.0/deslop-0.18.0-linux-x64.tar.gz"
      sha256 "dc8ba000aab8c2500bb12c3f4625895000078a0a407c44647f9acadc7649a531"
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
    assert_match "0.18.0", shell_output("#{bin}/deslop --version")
  end
end
