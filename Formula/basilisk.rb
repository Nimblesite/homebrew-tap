# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.6.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "7dc87caa1a948fb39d3b85766acb1483994e0c90076d83e37e561801b12d633d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.6.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "169c881a4f3b6374913f562fc495d3dd3ecf8850fe77fa51ec4a94ced268e571"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.6.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "673b8877c792ae9a709cecce36a3e9e39b2c7ab64396d9c52e825b6f1fe7db91"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
