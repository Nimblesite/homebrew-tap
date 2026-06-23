# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.19.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.3/basilisk-aarch64-apple-darwin.zip"
      sha256 "da18101f9a30656043e9d810520937f35bd107ebec97ea5daa2ffb8cfa5b0fe4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.3/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a5149df9ff6675f95e104a6c663be557d4e8807aa026de8a8742ef58bb07766"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.3/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95ee116611e59072adb5956df0010ac7808729be0c9f09d586e8674898bd53f8"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
