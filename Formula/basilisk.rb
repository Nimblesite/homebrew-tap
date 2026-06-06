# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.8.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "95d9960b291139bb14264f9493e42005aee3b26e339f9360ac8b65eecfe59481"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.8.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0b4da19c1e41481638994531ffc73b6b7d85cc65977aeedda18eda49fcb830d"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.8.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37c73ef567c606de68108b2a385768a16a329fad7b5bdd059ee1c75b6b3dec72"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
