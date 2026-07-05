# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.26.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "924f53138a763cca490f3541ca8f91efd209c88140486ce86b4500d3789efef0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.26.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7a06785f41ad3150bf6fc9c5630d28a5015e3ed2f15b12dbed10904c2d682a0"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.26.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "834aba24b45e206c502ab77b082a14af22190cc043c86b5a47bfa54f2f71e5c1"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
