# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "ac136a3e73069401dcca20d80412bf02c45baf60e2c0e544ad843817ce93a37b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c13f3c21c47765d9f1576da16f626597e98fb73efc3810a6f56482a5464ba61d"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.16.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b83cff36cb251281400c9886a148e9eb4928a3bb02cf361396de4b9272576882"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
