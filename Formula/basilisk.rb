# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.15.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "a2bb541a913f5e592184e433292ffc705a6b5d2d271c3cc95af9d11a63e7e35d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.15.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0114e5756b8f117e7c1daf20efd7113ad14524c677ddb33098cc2f12753bffa0"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.15.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce7145cf3bb8616a4417568f2ea12f36c95785a356941a9b6ed94ce09524929e"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
