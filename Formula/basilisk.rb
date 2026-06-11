# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "8ef128ad8c0868e243cc292fce2f47e187de8ed14e8c5e33711bcf1eed000d19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "629c61ca028b535ecde78d66e035f706bbd1d626d76c2f8f3c1002ac71406108"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5762d952938fa0301607c552bab64a89f442836e05564196e2c5db25cbd48ed"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
