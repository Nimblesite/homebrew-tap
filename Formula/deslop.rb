class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.35.0/deslop-0.35.0-macos-arm64.tar.gz"
      sha256 "aeac8e2e575d2733b4184ffa13440b860f283c607800c5430e6e8474843887da"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.35.0/deslop-0.35.0-macos-x64.tar.gz"
      sha256 "970b86c52f2f388935e0765c58f5f8d0ea1a6ac4fbbc40b0b31086945e4c3122"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.35.0/deslop-0.35.0-linux-arm64.tar.gz"
      sha256 "f217ed8eb70008af3aa8e5456763804e426dcbfa758febf35ad5eadf76899da7"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.35.0/deslop-0.35.0-linux-x64.tar.gz"
      sha256 "c850dfe821520ad2f09bd760883ac30b8ef8a430cecf95eb6e2cbf7a5918997e"
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
    assert_match "0.35.0", shell_output("#{bin}/deslop --version")
  end
end
