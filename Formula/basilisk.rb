# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.31.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "98d8c0da2835c35a6b9e7179ecace68f86121ef9fefba3c6521beda7def30e31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.31.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8897f2e70463faa444ac74af3d48eecf1d346a470532014f4029c2e95c43f683"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.31.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11d6c23aacda1da9b6c7a7cdc91f8ec92eb23e42ff8b048ec09445f6b408b1d9"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
