# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.21.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.2/basilisk-aarch64-apple-darwin.zip"
      sha256 "b6b8ed509ab3355af88c9bd5223de39e87c178cc1f656a657d2d917e1f5426fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.2/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa616ce3e7e09da83ec969adac5baac3943bf5e74e92658c47cd9be42f98e0b2"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.21.2/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c29636168f8ee99090c05492481217e7e7451325789214a6e3cd666c4f2a58e3"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
