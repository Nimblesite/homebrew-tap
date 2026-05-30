# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "ed2fa64ce866c365228f1632bd7c4d60b6c5e6fe8be56ddf2f0d85ed14541d57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1ca8fce05cf4f3f3ca5cff07d2cf9ca87d6f47dc97cf28ce758d49b5d67da84"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c57570afd35be6f8a64c5f4289b1b9b8bc2a141054d3ae014acd444822bc7c95"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
