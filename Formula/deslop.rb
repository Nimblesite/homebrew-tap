class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.11.0/deslop-0.11.0-macos-arm64.tar.gz"
      sha256 "a7a04b355d75ab82e2048b0a2e5c66236b52b6e9d0abf4cb48f4af49effeb665"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.11.0/deslop-0.11.0-macos-x64.tar.gz"
      sha256 "b5f2d9ce92745ea1402abf67dd27691b4dd3394cf02849ccae5ed7af462bb744"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.11.0/deslop-0.11.0-linux-arm64.tar.gz"
      sha256 "341adffbc25d742bff9cc0c36eb45126d03312149e18b084e5e6b716082eada6"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.11.0/deslop-0.11.0-linux-x64.tar.gz"
      sha256 "cca0eb97e81b232cfa7cdcd13ed8e876746810736fa018daccc3c380730f8ef6"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/deslop --version")
  end
end
