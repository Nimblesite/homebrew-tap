# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.17.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "5343bc5fcf1b8bc0e963e73eaec6694111823e9add2bf1bf43cd6d7669bb0789"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.17.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a929afd59b27fcad3e5172a70e98ce9d53f2c30fcbaee25c7dedd89e9ce1776"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.17.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ecab40ab764e4879aa1cdfc5807453527f9639a32dfd6b912d4727efedc12dc0"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
