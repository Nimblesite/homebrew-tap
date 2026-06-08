# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.9.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "06853645b4cdbc00ca42a9c54bb0c99bd31f859277179fd40bd2d1aabb566296"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.9.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "664f4aeb62d0122aa17f02da00386d9487005ef0408c37312d9098f7d91db9d2"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.9.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae3d15bc5383e83522c7b12b841c1b8b232b953bc240c352c691397d5349ba2c"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
