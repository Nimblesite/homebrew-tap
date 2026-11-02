class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.0/deslop-0.40.0-macos-arm64.tar.gz"
      sha256 "ee1fc868b8611598552a48b8ff2ba93283486603257ea5c59c0e7e37d33f08d5"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.0/deslop-0.40.0-macos-x64.tar.gz"
      sha256 "9657130f272ee0bd40322725d965b0ac86ef74f5559b958704d6e3beed01f4d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.0/deslop-0.40.0-linux-arm64.tar.gz"
      sha256 "4c55cca1aa09745d784ff50273b027ee183b43b568eb5d085e6d39b857184b7c"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.0/deslop-0.40.0-linux-x64.tar.gz"
      sha256 "aa181983869f16f2ca0f30b2ed8b83c69ed94fd56ec79809189e348cbeef0c16"
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
    assert_match "0.40.0", shell_output("#{bin}/deslop --version")
  end
end
