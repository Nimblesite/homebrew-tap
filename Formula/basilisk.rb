# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.12.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "eda9a05c63035cf2785deb92e3ddf19697c8950865f666106c13be1cc917c3c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.12.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9276b4e899a263b3bb2e1ab542f6c7e923948a17d2847769cb3e3735ea2db977"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.12.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8ed32933bb19063a92f196958ecf720f357479fe1caf0d7a2ace4f70b27eb5c"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
