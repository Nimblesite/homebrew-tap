# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.28.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "61c4478e9dadaee844bb39880187794a5abff24862c0102e95da4f67f03310a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.28.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5fd752b335b46816f532091bf3893da33596bb7470844ceb762a8c523204ecb"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.28.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7050b6cb0dc960ffde3d9be5d103d0fb6f751036765bbda357020627c4a40f45"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
