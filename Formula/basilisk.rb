# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.13.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "5ceaee28ecc5218945c39cebb630ce9da3fb363126a2acb3d8a93d4573121f5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.13.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6148f4ffd75e37339b092f6b1c53c140983c05f48de3ebcf5c2b2a5c97f114ac"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.13.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "690b5b6b18283a9c84bbede5aff2d50268130e8f602a6d1f1cb1ff8c4349817a"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
