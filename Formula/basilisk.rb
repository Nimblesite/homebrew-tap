# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.34.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "2d3dacbfa6786bf209c980fb20338e939c1acd592527fbb41d4355f6cc03ea10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.34.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26ab8a4f7a4286432622ec5b572590b538a1287e7d30a3f598af74826cedf4da"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.34.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cddd6cda2c8edf0b904accd2b677f470fcfde83fcaf5e00e0037c286d3b2a3ca"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
