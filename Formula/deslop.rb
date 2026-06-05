class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.0/deslop-0.5.0-macos-arm64.tar.gz"
      sha256 "46f5adb2b18899542ec25caa0bd76a4458682d964074bcb58b1f198c921ae65c"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.0/deslop-0.5.0-macos-x64.tar.gz"
      sha256 "c522bbaa91348a6ffa269999670c1c951808c4697aba7210c9d57baa2df5c9ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.0/deslop-0.5.0-linux-arm64.tar.gz"
      sha256 "515e2b93e35d66490bd0f3fd4a4fd82d4d077a7ff916d15ce5fd92389160855b"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.5.0/deslop-0.5.0-linux-x64.tar.gz"
      sha256 "04dade135b760b393982a1af35eafcaa243d447195aa386c3d03fbe947b59276"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/deslop --version")
  end
end
