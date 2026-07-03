# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.25.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "fd74629902a19fa98ac918383ce9d3af8900d2c7919b47518d7380036a6f3baa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.25.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e8d0039b612c3521ad976f735ebda9a1f565037a02d881c3e05d209640b7ebe"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.25.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a69714f16f05a5d541a380cd8b8e3f27ea130f5d4b88fb429fb4866e0d65b21"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
