# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "5cf5c0c5dce4159b9bb1c6cab18f03737f0f40fd700611ae9e1f90801aca756e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "117008ae24e6f677e8da5c7a7c7ac325b69ce227e2e000ccc1b8902265cbe05a"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.41.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f11d69b30ed54547decbf5faa5f753330e27a596d854e5aa3f4335115507032a"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
