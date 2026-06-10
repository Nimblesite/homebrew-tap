# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.10.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "1951146dbb7e9566eccabaa342712e82b7d19da1fe9661b7613156cc988305b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.10.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f83ccdd3433bad718b3eb8e7cf965a250947da59c8cf471d40b9d676f85f1fbe"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.10.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7a2ca1b1ca762a3b66821deccfc352ef8c89f8ca3722dfee4143ea011977491"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
