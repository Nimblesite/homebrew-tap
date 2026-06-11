# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.3/basilisk-aarch64-apple-darwin.zip"
      sha256 "c45750feb8ccec4789e6afaff60244c27bec2fc815005f384e8c741382636290"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.3/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a426b5dec9348e13d193b64bdfdf8727d72aa9c3b73334ef2e5e39ba8d8dd89"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.4.3/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a983b79fb9297d71b86a14efaf15dd9719c81dbc7deeb0bee3bdd16f682f7e14"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
