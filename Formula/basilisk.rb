# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.17.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "407784207a456f9a20d318c81d916cebd0e87d66562ab03fe5ab891b4f731508"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.17.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1dcdf6f2d3161120d295349d50dc89a55dd655dbbcc132eb15c48cf783c82968"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.17.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56c6cfa966aac8725d90b17e19492b45f77cf636ca0b5e0a45ed81e72a9e6f8d"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
