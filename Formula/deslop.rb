class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.40.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.1/deslop-0.40.1-macos-arm64.tar.gz"
      sha256 "7e80da16c534002134738b17c4c9268aceae2ede954732136f662976d404e395"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.1/deslop-0.40.1-macos-x64.tar.gz"
      sha256 "d979b949e72a5c252e976e03abe9a66db82dc91d48bbf58ac064b603ad65d003"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.1/deslop-0.40.1-linux-arm64.tar.gz"
      sha256 "5b1b8c71fc339b9c73cd44743b3b8811250c46996e84aa4153f8b66104399c1a"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.40.1/deslop-0.40.1-linux-x64.tar.gz"
      sha256 "277b4eea1d859f803a695f35b2e0e0bb79a8f47f922f2e4e9a533cf2af36a499"
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
    assert_match "0.40.1", shell_output("#{bin}/deslop --version")
  end
end
