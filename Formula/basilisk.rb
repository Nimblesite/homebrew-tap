# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.2.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "4271fcda93793043a47c2771aad3da4bd1334118f25ecf4cf5506a97e39c42c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.2.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2bfdfb372211fde604109337483a95aeeb2b69017bce290caae64587f77d4c9"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.2.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6a3936bc14883377c6c500fc4a57dedce5830c09a08fb58b6f3a921fce7c5ea"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
