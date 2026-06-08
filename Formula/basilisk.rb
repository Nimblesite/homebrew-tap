# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.9.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "15f88d943bbf607d3d583ede49b31645d0cd724385a1e73b031e68fc46f46672"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.9.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e7c269a22294699091b6fb2dc7f803818b5b72e0e16452ebcb8c0d7c206099b"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.9.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdeb033182ef36a34e83a18f111c99af10bffa907125ac5f79a076cdaa28f72b"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
