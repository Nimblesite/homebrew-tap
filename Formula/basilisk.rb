# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.41.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "4dfcd0072967cd77cf884415a3cb0a5d2022d5244471ff7dd87130199ee08674"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88a5e43b2cf246efbe2a2a748577a045b9bc70f2beb65cdd5d1024ca8f61ee26"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68c5f90ac92e5b2808c4fee9b880168948cfc363a52fa8dbb473129e52810631"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
