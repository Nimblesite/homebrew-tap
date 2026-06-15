class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.12.0/deslop-0.12.0-macos-arm64.tar.gz"
      sha256 "65f277531bd05a2c02185327105af626a2faccb3b5577ec63e415f0b03b30b77"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.12.0/deslop-0.12.0-macos-x64.tar.gz"
      sha256 "9e27acf2a5274142779c817e3d23c9180b63d33b074978963eed9cf20f8d827f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.12.0/deslop-0.12.0-linux-arm64.tar.gz"
      sha256 "35517bf526ca138cf6303ac5c551202110aaaec315078a52a8b1a24cfd3540ec"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.12.0/deslop-0.12.0-linux-x64.tar.gz"
      sha256 "ab815a4ac5a8fac4867f2d497bd2dbf6c0f00869906af73feb102c73d3823fc9"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/deslop --version")
  end
end
