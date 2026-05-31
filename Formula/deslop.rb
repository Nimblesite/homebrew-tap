class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-macos-arm64.tar.gz"
      sha256 "2707ee7ae68ce40deeeaedc5bc799224e8d51a27cffdad8b0406dba6e34406b4"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-macos-x64.tar.gz"
      sha256 "c1a46ea9b4a03049471de1e6376185aa1d725cbb64b37b3d4c153f248355497c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-linux-arm64.tar.gz"
      sha256 "79bdf1d63dee9d6954a9ba4d6ac3d7709eeffb153689b5bcf6291b84c6f87927"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-linux-x64.tar.gz"
      sha256 "9851a5c453e86bd80ca9ba7972f6418e048054ac9632cdeda8e2b1ac17239897"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/deslop --version")
  end
end
