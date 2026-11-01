# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.28.1"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.28.1/osprey-0.28.1-darwin-arm64.tar.gz"
      sha256 "515c57223da65cb0723a58ed04fab17b5b748cb2c9c3a4b4aaedb3dc21f0243a"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.28.1/osprey-0.28.1-linux-x64.tar.gz"
    sha256 "24017d6b891021a7f6fd14fced36a6244fb7a3a5abfa31402909a2979bf3f2e9"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.28.1", shell_output("#{bin}/osprey --version")
  end
end
