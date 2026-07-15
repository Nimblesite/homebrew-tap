# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.35.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "34503146c0fd348c6d5dde6e36b55ed9ae04a19dbfab6462d14ad17baa6c9cdf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.35.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a8bdaead39cb5e35623624c06eee54985625b30f6d0163b10fa295c5747581b"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.35.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d8621c933ca1b027fd4d3d05b7dda30aad00a3faf1f3dd67856ec78dd135d07"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
