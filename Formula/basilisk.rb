# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.19.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.4/basilisk-aarch64-apple-darwin.zip"
      sha256 "b54deeda32c14b447885189d93186272c8efaa78f121343546f34ff4ccacdd2d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.4/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3715cbdce38b9862c0368f014cdc15348bd151ca90c074951e8f6c427ac8243"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.4/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9795ba4f13d7d2c8327a4cecfcc5838cc55d121f7d283a6a570592f0b962a8dc"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
