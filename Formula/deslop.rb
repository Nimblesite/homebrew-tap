class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.32.0/deslop-0.32.0-macos-arm64.tar.gz"
      sha256 "95d9f0a35a4330097a009997baacd65474f8b0c789ff0e84595c5376a7721445"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.32.0/deslop-0.32.0-macos-x64.tar.gz"
      sha256 "a38c0bece03cf6f8902270cc569b18cac0f6001959d2acc5fea60d649ffacd25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.32.0/deslop-0.32.0-linux-arm64.tar.gz"
      sha256 "505201815687e04b20f5ea6dabac7095112c9b65c0d96c5e8f33b05e2bf08624"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.32.0/deslop-0.32.0-linux-x64.tar.gz"
      sha256 "231fd9893609b4fea945b31a6d6e13b3c5fba78a4c94ce2369a8e47faecc588b"
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
    assert_match "0.32.0", shell_output("#{bin}/deslop --version")
  end
end
