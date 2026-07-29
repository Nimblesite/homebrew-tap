# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.38.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "f586bddc0109ae6afe1530a6acda177850e89c486003cd4493c75300603e56be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.38.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ae28b917c1d415b20de0b6435c2f126d9d114bcff93534f87b9688b908d22a4"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.38.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d1e5c5653eee3bc1a3b3f0e674fecef389a436a45cc5523417f9adc4ed1d2a0"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
