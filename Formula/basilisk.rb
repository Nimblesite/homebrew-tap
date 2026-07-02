# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.24.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "c94473c2063d362b8fe57cc70b28b024376c0419d94196d427fb986dc52a1ac2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.24.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "564348df945a9ef5d6e538afe8ed28c33669432a17e6491d7891b609cfbf1b41"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.24.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "672d3747affd29ba22acc50642289ef37f8e594362a6957f21407d970b87446b"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
