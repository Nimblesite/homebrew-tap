# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.7.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "4293fa19002c7c4038ad28015f1cd016dd2d5823ac499a39e899807d6ad0ba71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.7.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40ff86faddb92bcf7f062ecffc6ae19279bf5f6ce2fc32978e30b356a1cf8ada"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.7.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a64ee18be6fd46c1f65a745821f9416966666ca6a931de34faab04900718a1f"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
