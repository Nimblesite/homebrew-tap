# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.2.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "88d632dabfef9cf41e568b2262d355ec328a96a4240ba3a48aab46828389b3b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.2.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b4bf428b7a975d2a8819b7193c59e148d0e9664f48e479e618565470d494ed1"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.2.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9d47975080efa24b1c21247f8c2a0f1e363ac85bbcf602aa60170d445565ecd"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
