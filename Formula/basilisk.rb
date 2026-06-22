# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.0/basilisk-aarch64-apple-darwin.zip"
      sha256 "c6ce99252ca754c4c45427a9efd68cb9c5e8a7406ac227ce333d10bf3ccd4233"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.0/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9dc12088959ffa2554cc49a4848d7a439cf3a31ab8df9d69cdd8c4c278972c9a"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.19.0/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a965a71c665276c1158ab7303ddcfc2830157494a186d525c1000218f545e345"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
