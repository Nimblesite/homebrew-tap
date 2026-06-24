# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.20.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "505d75d0487a5e9a95ff03f08eeca320dded04757c108242a3c0ffa8252b8957"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.20.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d856cbcecaa8b5af0add2245247d6eb875fe0fa838a367ca95ace955ae6e310"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.20.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49d3997d3bf68ed6a307462a45775fd1da1aea31c7d6382d0595709917a3cce4"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
