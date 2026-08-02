# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.39.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "71f16a1ba02d1e1f99c72d2253fc8fbd2a194a3ca93eac3baf899593900cfc68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.39.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66f78814239438ec40c6eeb6e7c4a3916b0b6205438c804b3a8adcd6e76f2115"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.39.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86b612d76588f55929a0d54b27a679d39411b6c1764527ab9e443161aaef32af"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
