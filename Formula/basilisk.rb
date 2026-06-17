# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "d3ee3227bf33c33abae58fb20e6cb719f0e353f840fc7cc4c0dbdda7bb1da11f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9e97fba49131a5a3183a3aed15daee03fd139d2012aa0b70e4353a51ca84fd8"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26618966b6749b5fdc7cd4096527eeb733a6cae0e796d27fde1b72f15a7dfa0b"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
