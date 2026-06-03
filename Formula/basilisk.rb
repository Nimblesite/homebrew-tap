# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.2/basilisk-aarch64-apple-darwin.zip"
      sha256 "32a4f93f13717fff213aa334787563b9ec12820dd36593df31fe1326588332f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.2/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d18232e3958e905ced664ae5ebfa75b1e3fa46ce0cd4a8f7ab6e27c8169027c"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.2/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d004289a24e6f73746a6edeaf31d223c99d86078ed8888702e641fef58eaa4f"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
