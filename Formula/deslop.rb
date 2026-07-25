class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.27.0/deslop-0.27.0-macos-arm64.tar.gz"
      sha256 "b12c770572b5e843186b883c45ae7098e79b96b1c4de651b7bb111b2c41bc42f"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.27.0/deslop-0.27.0-macos-x64.tar.gz"
      sha256 "6330f080022852fa877df1e0fd370ea54a60e41803697311e29a4c90ae472edd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.27.0/deslop-0.27.0-linux-arm64.tar.gz"
      sha256 "ff14aceaaed955b8917774d86ee0448cb82c9cf3912e3d5eb118db8db01e8d12"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.27.0/deslop-0.27.0-linux-x64.tar.gz"
      sha256 "485836a68adef20eb0c3da7976b25b755c11f78d2b47f188ba6d5d00f5234f28"
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
    assert_match "0.27.0", shell_output("#{bin}/deslop --version")
  end
end
