# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.9.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.9.0/osprey-0.9.0-darwin-arm64.tar.gz"
      sha256 "aa146646ed6d78bb1eeedc9a59635b39e61f0370707ab54a98d986de63f7db90"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.9.0/osprey-0.9.0-linux-x64.tar.gz"
    sha256 "14a4e2a9a729ea53ec51ff785a3721772b8d581387ed3224fed5e47dc2264295"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.9.0", shell_output("#{bin}/osprey --version")
  end
end
