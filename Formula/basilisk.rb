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
      sha256 "e89ace11644a7c7871810884ec85ff001d23dec92d767a9cf126827cbaea9191"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "250f38b8d195da942d786f5f746ebf4bab92b51e249f4729b0ddcb92a156ffc6"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "710289f49cff3f87bd9db2ee3d61295869c5a7cf25dd7f6820c42022359818e1"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
