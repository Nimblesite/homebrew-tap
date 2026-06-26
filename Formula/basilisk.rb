# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.22.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "e9ee32e0580edc1c8e09c31821bf83589218a2b421a87baa68be68122ce03964"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.22.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cafd6cc8f92877084d2f0eb4de31526721e28327df528eb106440fadc1fd40ce"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.22.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21333367bae06a65496241177c9f4a55392b873e72f07ab446225cbddd68b247"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
