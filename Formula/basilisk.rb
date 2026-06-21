# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.18.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "bb416358fcd55a34a9e840fcb13859cd765a4f04f5125a751b68a42f3f3c569b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.18.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df161abed5c503e058b3c3ba2028104fae1f37417d8cdb8c6286441f557a3e45"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.18.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4125c74a643d7a446dd7242a7b8aa2ff5215e2ed9c89c9eb5760a8bac86982ae"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
