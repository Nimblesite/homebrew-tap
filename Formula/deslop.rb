class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.37.0/deslop-0.37.0-macos-arm64.tar.gz"
      sha256 "5dddd17e053bebfd98149a9664ee1647c7c0f91584bcea8e90f74da8460bf521"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.37.0/deslop-0.37.0-macos-x64.tar.gz"
      sha256 "e55f7e5bb91a8519f2877561d4458fa6c8105b908b993eb0a9609db7f1f7ebfd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.37.0/deslop-0.37.0-linux-arm64.tar.gz"
      sha256 "2c084c3ea51004b8da56bbc3d7b0ab6a4a056b70a285bc84c89f1e0640f861e0"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.37.0/deslop-0.37.0-linux-x64.tar.gz"
      sha256 "d1cb814255072dc9031587e80ef81e9d3b4a10213beec9f3355a3d8069e85dcc"
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
    assert_match "0.37.0", shell_output("#{bin}/deslop --version")
  end
end
