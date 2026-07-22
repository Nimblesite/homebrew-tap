# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.37.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.2/basilisk-aarch64-apple-darwin.zip"
      sha256 "910374058b257e2491269a87523987b4b59e08b188017e0909c228b6b3c5f31c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.2/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68d1aa589905eb6c0507f4529d095af72e089e7d999cbcf0284d5330e46d4ed5"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.2/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "defcfca28f41ae265cef57c32bd8415975784b79e56d2879acb741aacd8bd2fa"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
