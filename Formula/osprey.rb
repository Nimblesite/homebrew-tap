# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.31.1"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.31.1/osprey-0.31.1-darwin-arm64.tar.gz"
      sha256 "9dde4e0c9c55cb54576811d8bd7f802ccb92c457ce404a17858e6c2214d20f76"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.31.1/osprey-0.31.1-linux-x64.tar.gz"
    sha256 "f144b9b04dc69db23a6cf964c133200c53a3b9f71d2dfbfe06a9f88e82edeb5a"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.31.1", shell_output("#{bin}/osprey --version")
  end
end
