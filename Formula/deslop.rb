class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.15.0/deslop-0.15.0-macos-arm64.tar.gz"
      sha256 "2eae01f0fe4d6d01c31e114be2194e81ea19b2d9cba541a20bb7dbb1cbdc88cc"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.15.0/deslop-0.15.0-macos-x64.tar.gz"
      sha256 "495b345cd8c66178327cc7617f0518b4e5f5a278837e0a8fbdc91a17115c0bbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.15.0/deslop-0.15.0-linux-arm64.tar.gz"
      sha256 "383dac06a522075de438295b9dfe6070cb3742d068a82364eb39e34451d189bf"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.15.0/deslop-0.15.0-linux-x64.tar.gz"
      sha256 "c61662b3a96a54b8cd53bc044d2799d42d8fc6ca8e1bdb31ceb236e419917e5a"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/deslop --version")
  end
end
