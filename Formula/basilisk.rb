# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "68f31f066431c7b1781781636dc77ec3ea356a7513fe1955795351905a1d2171"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d8556979dfe435b3f29aef0b56ec8c463716d29149661c41006144c3ff85206"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ecd101e90d0a050cea954687a71fff89a2f292da6eaa08aec011480b7c659658"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
