# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.21.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "498e94304a778fd14b403e6fdbe996a4ba2dd699dac54df8b1dae90ed9d200c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8afbeb45578f3ef5091e44f2b2f7ae276f2d7c326673fc04c98d891de3177fc"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70d2ae1baffcd48859eb106580b843acb37061fafea78592df020077a502d252"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
