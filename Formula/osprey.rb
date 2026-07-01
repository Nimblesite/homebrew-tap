# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.10.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.10.0/osprey-0.10.0-darwin-arm64.tar.gz"
      sha256 "cc7a063254ffd460fff08a993b32a7d992fc8386d9f9cac25539f86b3734298a"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.10.0/osprey-0.10.0-linux-x64.tar.gz"
    sha256 "d042a90e63b918cc007f9b840eaf9271133705ad5a79b3b0e07be5b11f42d574"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.10.0", shell_output("#{bin}/osprey --version")
  end
end
