# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.37.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.3/basilisk-aarch64-apple-darwin.zip"
      sha256 "5387f1b7c6c09db7bc3f6bf5b1bc0df981e65eee184e58c9937cb049e36f8f71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.3/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c971cf52ce5c27ecb2c461cd8ccaea6bf53dc7dbdfd7b9eb6229b993d6c5757"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.3/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b2f6796342a6a9941436f58a7687c079f7654e72cf7f2abbaf1eded33408f13"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
