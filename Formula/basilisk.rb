# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.33.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "a1c266cc3e142497a6a25d739de90f8791bb81e469a7733dc763c64a1fda8ec7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.33.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b648b28ae053bd6b2ac8009af413c08400cdcecb30f450e0b1c598a0756b01be"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.33.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03e71daf817a32aa24312d3c1aeb48790cc22d99caca0d283e8c24fe1cac3250"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
