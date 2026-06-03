class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.1/deslop-0.4.1-macos-arm64.tar.gz"
      sha256 "d09ee60116491fce7ade64c34efc89873c4cb7500727578945e19d9d1cbe4a9e"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.1/deslop-0.4.1-macos-x64.tar.gz"
      sha256 "109146d5061961c63b2964673c5d0b49a13215f1a73679df124add3710f17f92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.1/deslop-0.4.1-linux-arm64.tar.gz"
      sha256 "613d02c8e09d677c7786c9a682f856e2b65ed3999fd51e38dc78876286123ffe"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.1/deslop-0.4.1-linux-x64.tar.gz"
      sha256 "eb2a003db1835c2196ea62d6d3ed18456e1d303702b15677fbacea5fe29db41e"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/deslop --version")
  end
end
