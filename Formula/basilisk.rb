# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.30.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "6db58419b48e6ab4f39219241eed45684a8d8987454633a306907ae94595fe82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.30.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59f8207e37e827ecfad7f09648cb461c65055ab0b156af03db8208f488c0b894"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.30.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f2b896af705fee9862c32f6d1e6ba6bf33f44cd3b1b5fa01a9b936bc0ab1012"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
