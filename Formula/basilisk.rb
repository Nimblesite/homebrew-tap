# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.3/basilisk-aarch64-apple-darwin.zip"
      sha256 "b4e235abbc1553293c1708d4bd3ec18db9c9b2a738b6a3cbb816024a2179caa7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.3/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0525bb62f311fca753e7cead07721e48415cd1d9a294fd06f7a58f1a74370b7"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.3/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed421c0105e48747c7e4fbedaa8f2c0b7c2d45d2c80751d794bc9f11d83252df"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
