class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.36.0/deslop-0.36.0-macos-arm64.tar.gz"
      sha256 "eb0eca1cb827cfb533a1fd4dc0ca20f2ec3dc9b1d6979c70c3e420c61788f2d7"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.36.0/deslop-0.36.0-macos-x64.tar.gz"
      sha256 "1156a402f739b8d39d947f2a7b96e7842f59386fc0159451f2e5003704fcfcac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.36.0/deslop-0.36.0-linux-arm64.tar.gz"
      sha256 "e0454ee7abfed5374380409748508415363bfd343aa8c683e07cc511a410fb6a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.36.0/deslop-0.36.0-linux-x64.tar.gz"
      sha256 "e031a6eca5b39d3fb5a537eb346537da2f6a9ff696bf098303feeb436055e745"
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
    assert_match "0.36.0", shell_output("#{bin}/deslop --version")
  end
end
