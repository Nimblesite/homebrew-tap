# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.16.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.2/basilisk-aarch64-apple-darwin.zip"
      sha256 "688a4addcd4b4ac1d82a31f328155db628f80d12b1d10d0a0268d66954fd730f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.2/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cbcc4f908f179a364cc3804b98a1606f801be172b4afd0d7b52296c01a71cd1"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.2/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69b089f456bbf8c1ccdcb1339ba364225bb444bba3555aa93716ce38bc7c4f01"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
