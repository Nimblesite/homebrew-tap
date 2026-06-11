# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.11.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "5aa3ed95af72c91cb77f4e95706b4ffd1ac8a07fc0b35af7c8479ebb783a78d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.11.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e508c96ab0ea25ba4f27cc1743697750430b0679979a051d82187c3a72ea4bce"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.11.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aceb6a608b8fee04d7af4082827a397cebbe83efc5ff16c116dee125ec192c48"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
