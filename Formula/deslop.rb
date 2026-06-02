class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.0/deslop-0.4.0-macos-arm64.tar.gz"
      sha256 "fb50b5c2ae50be13640579dd4671d9820707046c4c7ba22bd604b615d820a7f4"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.0/deslop-0.4.0-macos-x64.tar.gz"
      sha256 "100cd23cc050b67f7c34dd3ab99f7a36dace80382c7538d3a26fc974dd097a50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.0/deslop-0.4.0-linux-arm64.tar.gz"
      sha256 "e8fe245c66345cb5a6868172ce99be00925994870481e7e227b7a61bcb7895c9"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.4.0/deslop-0.4.0-linux-x64.tar.gz"
      sha256 "7d3eaf4033934a37d52cb339451de7da079abf6d80ea9f93c3ed27e156f33516"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/deslop --version")
  end
end
