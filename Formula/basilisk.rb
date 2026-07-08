# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.32.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "a4dd20adb65949c85a92fff55efe61bc7abc18161cfe7b609c5d0299c6289591"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.32.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a56a44bb1808bdf501f4e3e32105ea8abd930d8c0952a30669a438046ec81dbe"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.32.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c68de6f27ef69478712de9131e6ae8a4bd65fdcfa72ac64b3df025d16228364c"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
