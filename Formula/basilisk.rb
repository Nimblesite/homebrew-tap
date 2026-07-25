# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.37.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.4/basilisk-aarch64-apple-darwin.zip"
      sha256 "dddf18982d52f381f62eddf6b08dfcdb4259178e6e3f7123064855969e376931"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.4/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10d76ca6f4832f97e6b9209fca701e6215d63955b3f659b1dd706ff30ce94267"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.37.4/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "92ceeb174c16af0fc05d2d018c962c35bc2bf2a120d47a96ef69ddea1af3606d"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
