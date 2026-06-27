# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.23.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "fe9df0594ed6bb5f297b86536a534182f8a913cdc99f4d14c4aea06af60ddfdc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.23.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1cb3c708ee5aab9335aaada165d461426c21e7a7f0c50fa7fc0f555313c0d21"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.23.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47417db0eb302f4da6fe3bfc8f3fcef1aea70f53694db08508a63bd7f3f8f440"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
