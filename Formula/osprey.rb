# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.20.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.20.0/osprey-0.20.0-darwin-arm64.tar.gz"
      sha256 "d76f96be833f59604842921f6778e5ae9fd28c5f872d67a62d8b21df2dfe23d5"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.20.0/osprey-0.20.0-linux-x64.tar.gz"
    sha256 "c2dab3c0fa3c6bfe0277a515e2012684618e2fe0681dd88c9475a9abc6699a97"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.20.0", shell_output("#{bin}/osprey --version")
  end
end
