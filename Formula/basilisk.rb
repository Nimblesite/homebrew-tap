# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.14.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "0799763540063415e9ac3e18e7dff0bfb34d13209d4037525a6b64259136f431"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.14.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2fbf034c403cf72958bbcefc4cdd8af5b05151947b18bf1a5810a89cc96e74d"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.14.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "444d7f112ddf0b2a6429dbb4a97d78a6281c332654801b97f7f351a13ecd158d"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
