# typed: false
# frozen_string_literal: true

class Basilisk < Formula
  desc "Strict-by-default Python type checker and LSP, built in Rust"
  homepage "https://www.basilisk-python.dev"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.1/basilisk-aarch64-apple-darwin.zip"
      sha256 "068c5345d210d37e2bde848aeab85120407b8eba30ff34a65f0d165403fd61ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.1/basilisk-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd4893b6daa2f0af72d3af667373678bbe55a136abc302c474890629ef46ee71"
    end
    on_arm do
      url "https://github.com/Nimblesite/Basilisk/releases/download/v0.5.1/basilisk-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a548a2bffb8c235ae0b6f209e0dfe6f343d92e543ff829360918666e875c91fa"
    end
  end

  def install
    bin.install "basilisk"
  end

  test do
    assert_match "basilisk", shell_output("#{bin}/basilisk --version")
  end
end
