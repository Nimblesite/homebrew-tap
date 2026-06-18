class Deslop < Formula
  desc "Live duplicate-code analysis server for AI coding agents"
  homepage "https://github.com/Nimblesite/Deslop"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.14.0/deslop-0.14.0-macos-arm64.tar.gz"
      sha256 "cf947739f3010970681bab332d14ea95130eefb1c4ac06df60b032702e5291cf"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.14.0/deslop-0.14.0-macos-x64.tar.gz"
      sha256 "b3702e68c40a376bc73604489b9fe9975ca336acb1f2297840b75d72bcc427a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.14.0/deslop-0.14.0-linux-arm64.tar.gz"
      sha256 "dd71d9149bcdc1510243757ca9a2d1297d76ab474c6bdfd6be81ebb00915bd47"
    end
    on_intel do
      url "https://github.com/Nimblesite/Deslop/releases/download/v0.14.0/deslop-0.14.0-linux-x64.tar.gz"
      sha256 "193c0ccca2f2092d428b0bd8a8119639763ba03877282fad58c061b4f009baae"
    end
  end

  def install
    bin.install "deslop"
    bin.install "deslop-lsp" if File.exist?("deslop-lsp")
    bin.install "deslop-mcp" if File.exist?("deslop-mcp")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/deslop --version")
  end
end
