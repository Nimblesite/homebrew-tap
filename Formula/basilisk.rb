# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "a5b9f1aeadbfa011da6071de7c20a6c5089d9ab6905d25d59331ae01cb182fa8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "454824682643f3ea1b364f1bacf8b09fcc3037db9c6d60291db2454b01d33d38"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba4088371fc4deeffe1805292e3d347ff6704f5fcab7ffcea24eac8f06e4ef53"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
