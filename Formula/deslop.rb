class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.16.0/deslop-0.16.0-macos-arm64.tar.gz"
      sha256 "1f61026f128db5ce59ac873888fe8e70d2ede2f6d323624a72fcd3c29bf36a54"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.16.0/deslop-0.16.0-macos-x64.tar.gz"
      sha256 "32cad2ea0fd8a80c9079bda298b433f4ea63b2524f18bca1d6180d6f6fc79b89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.16.0/deslop-0.16.0-linux-arm64.tar.gz"
      sha256 "d1cd2a484cea4ebcc361c5be4c091b9ed73700ce5ab747448f4dbf4eeafaa992"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.16.0/deslop-0.16.0-linux-x64.tar.gz"
      sha256 "b64aebefb2545904085397483be6d695e623f610423301b71f62fbd433ac9e04"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/deslop --version")
  end
end
