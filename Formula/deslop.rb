class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-macos-arm64.tar.gz"
      sha256 "3bb7f778ad7b99e923e5dcf4eefe7e86474341f3975ad6a425c9fdc1cb019653"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-macos-x64.tar.gz"
      sha256 "534b962fb02204014c918b2ae7b9f7e6befba417c79e7dba3160f0be479789c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-linux-arm64.tar.gz"
      sha256 "848dd466cb18782cc777bccd1e3feff94ae98c16bc0b366aecff838ef6d71681"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.34.0/deslop-0.34.0-linux-x64.tar.gz"
      sha256 "a04faff020f7dccd179957ba5719fe6a5fe8447f175b65579568dd8375d58b62"
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
