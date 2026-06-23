# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "484164fac4cd8148be0f5612b4c22be16a3ea7f8b0daf9f4c420ef35a74986ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d3d4d8c5d8fd91d9fc38edbd5a719c19b434995c833b0a3c090d5b7b4c9a8c0"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0ef11567def29da5236df102c5173c581b1209c06546b5022cbe9f331d8dde6"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
