class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.13.0/deslop-0.13.0-macos-arm64.tar.gz"
      sha256 "610a7e18b08049b414ffb46d8da8553f8f8388ea2a47466426cb3dd24c3f9659"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.13.0/deslop-0.13.0-macos-x64.tar.gz"
      sha256 "f17f241b7d355e17e16a7e80dd13f1fb2d38c6c17ce71df43cad976cb2836a00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.13.0/deslop-0.13.0-linux-arm64.tar.gz"
      sha256 "38bf5748379414ab5c2146b1e3f569eede742a0cdf73d3cadf35707d50d4a6b8"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.13.0/deslop-0.13.0-linux-x64.tar.gz"
      sha256 "4e8d5d45e4a810e6e2dee590fadd7808f98cb84d491e4d3a4d0f43ab69bb813d"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/deslop --version")
  end
end
