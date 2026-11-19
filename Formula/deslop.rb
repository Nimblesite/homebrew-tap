class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.45.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.45.0/deslop-0.45.0-macos-arm64.tar.gz"
      sha256 "c1072668ab310cbe07ec1b743e6b407c7c6f57ad8ed8b0b36f5d0e1f871ab5af"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.45.0/deslop-0.45.0-macos-x64.tar.gz"
      sha256 "0744ae8f66ea5e8b5042d513b21d3b2fe2687d73dfdbf998dce6f7ba3d3b2f1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.45.0/deslop-0.45.0-linux-arm64.tar.gz"
      sha256 "212c9a035c611ca55dff8ef9b931fbbd511bf4c1cc80d36c46318b84a0684d08"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.45.0/deslop-0.45.0-linux-x64.tar.gz"
      sha256 "74a6ad4b35ee33997622f7d35c13f17168f0bded96d83027265afc303d7547a3"
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
    assert_match "0.45.0", shell_output("#{bin}/deslop --version")
  end
end
