# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.1.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.1.0-alpha/basilisk-aarch64-apple-darwin.zip"
      sha256 "5b97109d74d43cce0b6166dfe623347dba0b60c5f673f5bbb3893fc015e0c019"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.1.0-alpha/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "514c8c70279b1705aff58353717e8415fc457ebd48dc34b53d0c34c0f68babe5"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.1.0-alpha/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1285e68cd647453fa7d65db9d7b9443546e9279b418d83ab5ee224d53368d65d"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
