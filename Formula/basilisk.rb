# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Basilisk's type checker produced incorrect results. Basilisk is unlisted and is being rebuilt from the ground up as a new product."
  homepage "https://www.basilisk-python.dev"
  version "0.41.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.2/basilisk-aarch64-apple-darwin.zip"
      sha256 "bd84e83818192ed1445c0bc39f8935a2e1f3013b21658b2e81233e8980cdf58f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.2/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "787c0ba831aca4ce5d71233d9a2ccbfb82a96f6171916d0f510741e4c802f728"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.2/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5288adcdd00555cc2b989cdc9a74bde48f86e314da18615aba113308a7002f04"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
