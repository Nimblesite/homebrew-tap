# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.6.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "489cbdf0badc55fab4d60a074c00594da1468de71132556482f9f39974577963"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.6.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "108551e1118c06417fa4bb9dbc14d9ef8f2af9d79259fb2d1f6d7aa0055fbc8f"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.6.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b17f17fd6ff0e869ab3613481ee2fb14de7ef76c9b5560cb2552f962e45005e"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
