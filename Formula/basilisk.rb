# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.4/basilisk-aarch64-apple-darwin.zip"
      sha256 "8c7bb6ca7fc26d92b78f63f1b4c0c2d83d2bdb55b8a016b631ce7eb57b5e6021"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.4/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23e01259c8b3205286c07c45d965bdef704ff20665be9690b8d0f4017532377f"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.4/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c49812fda6c44e3be76f9de2da3ccc5dca760ff95f41c406834edb643d3061c2"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
