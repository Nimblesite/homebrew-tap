# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.29.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "77804daaa413b0bdb8439f122470aacda07ffef8bcc1333fddeae7588dc6e76f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.29.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "480500ec33809d76e3f0688f39aaa84a66a77e18c1b9e732ce22e4a7bb7f034e"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.29.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "182b2e68d4ceb1a2b9e087181dc1b85708373e5958d565755afa433bf3b5fb44"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
