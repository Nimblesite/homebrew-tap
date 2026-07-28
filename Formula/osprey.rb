# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.15.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.15.0/osprey-0.15.0-darwin-arm64.tar.gz"
      sha256 "39d3f666a97d47b6a3ce95974ca313f43601d9b735eb6af5116de2f2aea11644"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.15.0/osprey-0.15.0-linux-x64.tar.gz"
    sha256 "dade9545534a9b652acf8f3f6edb76bd0b0a18fc13613318756b14d5304db5c4"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.15.0", shell_output("#{bin}/osprey --version")
  end
end
