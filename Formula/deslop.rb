class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.17.0/deslop-0.17.0-macos-arm64.tar.gz"
      sha256 "5820706d2e0f05505c1146f6df59597dc62e319efeed53c9a045d305c766cc70"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.17.0/deslop-0.17.0-macos-x64.tar.gz"
      sha256 "6b062ada478d4eaa10fe31c820d3fd43c75db959fa3de3bb21adc77a560c4d49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.17.0/deslop-0.17.0-linux-arm64.tar.gz"
      sha256 "56034c80beb55a440b6c0d9cd8cbce55e1974e7bc53e0ac45fb8358cd07048de"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.17.0/deslop-0.17.0-linux-x64.tar.gz"
      sha256 "b3e1332be7fef31cf25d8267b5f1880e31e375fcc7f7c5b1765f3249ac531166"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/deslop --version")
  end
end
