# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.19.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.2/basilisk-aarch64-apple-darwin.zip"
      sha256 "8a4fc8d3e9029c2a91407f696b308bf29f46b96e90d9092f4a22f6e41a3392e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.2/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "642baef58c261fbb5a2d531e40411b32ab68759591b81f3a2538d4bb4ccf9393"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.2/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a65e7877c69d3d4cec8bd133b23559e04135b89bd28e117de052882ba03743b8"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
