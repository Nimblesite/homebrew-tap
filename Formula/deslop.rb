class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-macos-arm64.tar.gz"
      sha256 "234bbeee4c5e7fb822fc7e506dbe59dccbee27a5d859127b17b837ff725ebedc"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-macos-x64.tar.gz"
      sha256 "73e932be171818207d84c6395b85903399cfabde2a5e2cb4add56d27039d8580"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-linux-arm64.tar.gz"
      sha256 "1696b825774da24231b7490234e041bc923fff79b8ee4df66ff461c1d79076be"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.1.0/deslop-0.1.0-linux-x64.tar.gz"
      sha256 "739191c7c198024e74134f2267490e43647d56f1ac71fc379777d0bc7aa4276f"
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
