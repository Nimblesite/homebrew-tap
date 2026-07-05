# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.27.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "20addbdae21adaf28c5fe7aa7f5db4f7b1e699fdd9cdd4e69826a19feff5399c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.27.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "592dad4a09914337529568bb764b7f702baee5a284cf4eb0d9d5887e204bf96e"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.27.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2f28b418e2a36bc69b96a3865cf97660ab3d1fd8e16100c3c29e5c0c1cafc9cd"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
